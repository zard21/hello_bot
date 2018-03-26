class SajuAnswersController < ApplicationController
  before_action :set_saju_answer, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /saju_answers
  # GET /saju_answers.json
  def index
    @saju_answers = SajuAnswer.all
  end

  # GET /saju_answers/1
  # GET /saju_answers/1.json
  def show
    next_bot_id = SajuAnswer.find(params[:id]).next_bot_id
    saju_bot = SajuBot.includes(:saju_answers).find(next_bot_id)

    render json: saju_bot.as_json(include: :saju_answers)
  end

  # GET /saju_answers/new
  def new
    @saju_answer = SajuAnswer.new
  end

  # GET /saju_answers/1/edit
  def edit
  end

  # POST /saju_answers
  # POST /saju_answers.json
  def create
    @saju_answer = SajuAnswer.new(saju_answer_params)

    if @saju_answer.save
      render json: { status: :ok }
    else
      render json: { status: :internal_server_error }
    end
  end

  # PATCH/PUT /saju_answers/1
  # PATCH/PUT /saju_answers/1.json
  def update
    respond_to do |format|
      if @saju_answer.update(saju_answer_params)
        format.html { redirect_to @saju_answer, notice: 'Saju answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @saju_answer }
      else
        format.html { render :edit }
        format.json { render json: @saju_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saju_answers/1
  # DELETE /saju_answers/1.json
  def destroy
    @saju_answer.destroy
    respond_to do |format|
      format.html { redirect_to saju_answers_url, notice: 'Saju answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_saju_answer
      @saju_answer = SajuAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def saju_answer_params
      params.require(:saju_answer).permit(:content, :saju_bot_id, :next_bot_id)
    end
end
