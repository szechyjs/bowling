class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /teams
  # GET /teams.json
  def index
    @teams = Team.all.includes(:league)
    respond_with(@teams)
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    respond_with(@team)
  end

  # GET /teams/new
  def new
    @team = Team.new
    respond_with(@team)
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(team_params)
    @team.save
    respond_with(@team)
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    @team.update(team_params)
    respond_with(@team)
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_with(@team)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_team
    @team = Team.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def team_params
    params.require(:team).permit(:name, :league_id)
  end
end
