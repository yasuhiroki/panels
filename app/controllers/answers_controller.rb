class AnswersController < ApplicationController
  before_action :set_respondent
  before_action :set_answer, only: %i[ show edit update destroy ]

  # GET /room/:id/answers or /room/:id/answers.json
  def index
    @room = Room.find(params[:id])
    @respondents = Respondent.all
  end

  # GET /answers/1 or /answers/1.json
  def show
  end

  # GET /room/:id/answers/new
  def new
    @room = Room.find(params[:id])
    @answer = Answer.new
    @answer.build_question_answer(question_id: @room.current_question_id)
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /room/:id/answers or /room/:id/answers.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to answer_url(@answer), notice: "Answer was successfully created." }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to answer_url(@answer), notice: "Answer was successfully updated." }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer.destroy!

    respond_to do |format|
      format.html { redirect_to answers_url, notice: "Answer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_respondent
      @respondent = Respondent.find(session[:respondent_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def answer_params
      params
        .require(:answer)
        .permit(
          :respondent_id, :text,
          question_answer_attributes: [:id, :question_id]
        )
    end
end
