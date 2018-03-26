class TarotAnswersController < ApplicationController
  before_action :set_tarot_answer, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /tarot_answers
  # GET /tarot_answers.json
  def index
    @tarot_answers = TarotAnswer.all
  end

  # GET /tarot_answers/1
  # GET /tarot_answers/1.json
  def show
    next_bot_id = TarotAnswer.find(params[:id]).next_bot_id
    tarot_bot = TarotBot.includes(:tarot_answers).find(next_bot_id)

    render json: tarot_bot.as_json(include: :tarot_answers)
  end

  # GET /tarot_answers/new
  def new
    @tarot_answer = TarotAnswer.new
  end

  # GET /tarot_answers/1/edit
  def edit
  end

  # POST /tarot_answers
  # POST /tarot_answers.json
  def create
    @tarot_answer = TarotAnswer.new(tarot_answer_params)

    if @tarot_answer.save
      render json: { status: :ok }
    else
      render json: { status: :internal_server_error }
    end
  end

  # PATCH/PUT /tarot_answers/1
  # PATCH/PUT /tarot_answers/1.json
  def update
    respond_to do |format|
      if @tarot_answer.update(tarot_answer_params)
        format.html { redirect_to @tarot_answer, notice: 'Tarot answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @tarot_answer }
      else
        format.html { render :edit }
        format.json { render json: @tarot_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarot_answers/1
  # DELETE /tarot_answers/1.json
  def destroy
    @tarot_answer.destroy
    respond_to do |format|
      format.html { redirect_to tarot_answers_url, notice: 'Tarot answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarot_answer
      @tarot_answer = TarotAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarot_answer_params
      params.require(:tarot_answer).permit(:content, :tarot_bot_id, :next_bot_id)
    end
end
