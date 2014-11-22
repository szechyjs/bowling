class BowlersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bowler, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  # GET /bowlers
  # GET /bowlers.json
  def index
    @bowlers = Bowler.all.includes(team: :league)
    respond_with(@bowlers)
  end

  # GET /bowlers/1
  # GET /bowlers/1.json
  def show
    respond_with(@bowler)
  end

  # GET /bowlers/new
  def new
    @bowler = Bowler.new
    respond_with(@bowler)
  end

  # GET /bowlers/1/edit
  def edit
  end

  # POST /bowlers
  # POST /bowlers.json
  def create
    @bowler = Bowler.new(bowler_params)
    @bowler.save
    respond_with(@bowler)
  end

  # PATCH/PUT /bowlers/1
  # PATCH/PUT /bowlers/1.json
  def update
    @bowler.update(bowler_params)
    respond_with(@bowler)
  end

  # DELETE /bowlers/1
  # DELETE /bowlers/1.json
  def destroy
    @bowler.destroy
    respond_with(@bowler)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bowler
    @bowler = Bowler.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def bowler_params
    params.require(:bowler).permit(:first_name, :last_name, :nickname, :email, :team_id)
  end
end
