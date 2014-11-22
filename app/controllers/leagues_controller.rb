class LeaguesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_league, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = League.all
    respond_with(@leagues)
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
    respond_with(@league)
  end

  # GET /leagues/new
  def new
    @league = League.new
    respond_with(@league)
  end

  # GET /leagues/1/edit
  def edit
  end

  # POST /leagues
  # POST /leagues.json
  def create
    @league = League.new(league_params)
    @league.save
    respond_with(@league)
  end

  # PATCH/PUT /leagues/1
  # PATCH/PUT /leagues/1.json
  def update
    @league.update(league_params)
    respond_with(@league)
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league.destroy
    respond_with(@league)
  end

  # GET /leagues/1/stats
  def stats
    @league = League.find(params[:id])
    @teams = @league.teams.includes([:bowlers, :league])
    weeks = []
    @league.series.select(:week).group(:week).order(:week).each do |series|
      weeks << series.week
    end
    @weeks = weeks
    @bowler_stats = @teams.map { |team| team.bowler_stats }.flatten.sort_by { |stat| stat[:handicap] }
  end

  # GET /leagues/1/week/2
  def week
    @week = params[:week]
    @series_by_team = []
    @games_by_team = []
    @totals_by_team = {}
    League.find(params[:id]).teams.each do |team|
      team_series = team.series.where(week: params[:week]).includes([:bowler, :scores]).order(:id)
      @series_by_team << team_series
      game1 = 0
      game2 = 0
      game3 = 0
      total = 0
      team_series.each do |series|
        game1 += series.scores[0].score
        game2 += series.scores[1].score
        game3 += series.scores[2].score
        total += series.total
      end
      totals = []
      totals << game1 << game2 << game3 << total
      @totals_by_team[team.id] = totals
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_league
    @league = League.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def league_params
    params.require(:league).permit(:name, :start_date, :weeks, :basis, :percentage)
  end
end
