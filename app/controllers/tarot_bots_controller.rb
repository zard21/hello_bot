class TarotBotsController < ApplicationController
  before_action :set_tarot_bot, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /tarot_bots
  # GET /tarot_bots.json
  def index
    @tarot_bots = TarotBot.all
  end

  # GET /tarot_bots/1
  # GET /tarot_bots/1.json
  def show
  end

  # GET /tarot_bots/new
  def new
    @tarot_bot = TarotBot.new
  end

  # GET /tarot_bots/1/edit
  def edit
  end

  # POST /tarot_bots
  # POST /tarot_bots.json
  def create
    @tarot_bot = TarotBot.new(tarot_bot_params)

    if @tarot_bot.save
      render json: { status: :ok }
    else
      render json: { status: :internal_server_error }
    end
  end

  # PATCH/PUT /tarot_bots/1
  # PATCH/PUT /tarot_bots/1.json
  def update
    respond_to do |format|
      if @tarot_bot.update(tarot_bot_params)
        format.html { redirect_to @tarot_bot, notice: 'Tarot bot was successfully updated.' }
        format.json { render :show, status: :ok, location: @tarot_bot }
      else
        format.html { render :edit }
        format.json { render json: @tarot_bot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarot_bots/1
  # DELETE /tarot_bots/1.json
  def destroy
    @tarot_bot.destroy
    respond_to do |format|
      format.html { redirect_to tarot_bots_url, notice: 'Tarot bot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def init
    init_bots = TarotBot.includes(:tarot_answers).where(is_init: true)
    render json: init_bots.as_json(include: :tarot_answers)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarot_bot
      @tarot_bot = TarotBot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarot_bot_params
      params.require(:tarot_bot).permit(:content, :ans_type, :is_init)
    end
end
