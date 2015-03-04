class SeriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_series, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /series
  # GET /series.json
  def index
    @series = Series.includes({ team: :league }, :bowler, :scores).order('id DESC')
    respond_with(@series)
  end

  # GET /series/1
  # GET /series/1.json
  def show
    respond_with(@series)
  end

  # GET /series/new
  def new
    @series = Series.new
    @series.scores.build
    @series.scores.build
    @series.scores.build
  end

  # GET /series/1/edit
  def edit
  end

  # POST /series
  # POST /series.json
  def create
    @series = Series.new(series_params)
    @series.save
    respond_with(@series)
  end

  # PATCH/PUT /series/1
  # PATCH/PUT /series/1.json
  def update
    @series.update(series_params)
    respond_with(@series)
  end

  # DELETE /series/1
  # DELETE /series/1.json
  def destroy
    @series.destroy
    respond_with(@series)
  end

  def next_week
    @next_week = ''
    series = Series.select(:id, :week).where(bowler_id: params[:bowler], league_id: params[:league], team_id: params[:team]).order(:week).last

    unless series.nil?
      unless series.week.nil?
        @next_week = series.week + 1
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_series
    @series = Series.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def series_params
    params.require(:series).permit(:bowler_id, :league_id, :team_id, :week, :date, scores_attributes: [:id, :score, :absent, :_destroy])
  end
end
