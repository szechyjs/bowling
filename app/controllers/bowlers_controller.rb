class BowlersController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_bowler, only: [:show, :edit, :update, :destroy]

  # GET /bowlers
  # GET /bowlers.json
  def index
    @bowlers = Bowler.all
  end

  # GET /bowlers/1
  # GET /bowlers/1.json
  def show
  end

  # GET /bowlers/new
  def new
    @bowler = Bowler.new
  end

  # GET /bowlers/1/edit
  def edit
  end

  # POST /bowlers
  # POST /bowlers.json
  def create
    @bowler = Bowler.new(bowler_params)

    respond_to do |format|
      if @bowler.save
        format.html { redirect_to @bowler, notice: 'Bowler was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bowler }
      else
        format.html { render action: 'new' }
        format.json { render json: @bowler.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bowlers/1
  # PATCH/PUT /bowlers/1.json
  def update
    respond_to do |format|
      if @bowler.update(bowler_params)
        format.html { redirect_to @bowler, notice: 'Bowler was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bowler.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bowlers/1
  # DELETE /bowlers/1.json
  def destroy
    @bowler.destroy
    respond_to do |format|
      format.html { redirect_to bowlers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bowler
      @bowler = Bowler.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bowler_params
      params.require(:bowler).permit(:first_name, :last_name, :email, :team_id)
    end
end
