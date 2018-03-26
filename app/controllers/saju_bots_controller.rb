class SajuBotsController < ApplicationController
  before_action :set_saju_bot, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /saju_bots
  # GET /saju_bots.json
  def index
    @saju_bots = SajuBot.all
  end

  # GET /saju_bots/1
  # GET /saju_bots/1.json
  def show
  end

  # GET /saju_bots/new
  def new
    @saju_bot = SajuBot.new
  end

  # GET /saju_bots/1/edit
  def edit
  end

  # POST /saju_bots
  # POST /saju_bots.json
  def create
    @saju_bot = SajuBot.new(saju_bot_params)

    if @saju_bot.save
      render json: { status: :ok }
    else
      render json: { status: :internal_server_error }
    end
  end

  # PATCH/PUT /saju_bots/1
  # PATCH/PUT /saju_bots/1.json
  def update
    respond_to do |format|
      if @saju_bot.update(saju_bot_params)
        format.html { redirect_to @saju_bot, notice: 'Saju bot was successfully updated.' }
        format.json { render :show, status: :ok, location: @saju_bot }
      else
        format.html { render :edit }
        format.json { render json: @saju_bot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saju_bots/1
  # DELETE /saju_bots/1.json
  def destroy
    @saju_bot.destroy
    respond_to do |format|
      format.html { redirect_to saju_bots_url, notice: 'Saju bot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def init
    init_bots = SajuBot.includes(:saju_answers).where(is_init: true)
    render json: init_bots.as_json(include: :saju_answers)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saju_bot
      @saju_bot = SajuBot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saju_bot_params
      params.require(:saju_bot).permit(:content, :ans_type, :is_init)
    end
end
