class SubmittedAnswersController < ApplicationController
  before_action :set_submitted_answer, only: [:show, :edit, :update, :destroy]

  # GET /submitted_answers
  # GET /submitted_answers.json
  def index
    @submitted_answers = SubmittedAnswer.all
  end

  # GET /submitted_answers/1
  # GET /submitted_answers/1.json
  def show
  end

  # GET /submitted_answers/new
  def new
    @submitted_answer = SubmittedAnswer.new
  end

  # GET /submitted_answers/1/edit
  def edit
  end

  # POST /submitted_answers
  # POST /submitted_answers.json
  def create
    @submitted_answer = SubmittedAnswer.new(submitted_answer_params)
    @question = Question.find_by_id(submitted_answer_params[:question_id])
    if @question.answers.first.name.downcase == @submitted_answer.answer.downcase
      @submitted_answer.score = 4
    else
      @submitted_answer.score = -1
    end

    respond_to do |format|
      if @submitted_answer.save
        format.html { redirect_to @question, notice: 'Submitted answer was successfully created.' }
        format.json { render :show, status: :created, location: @submitted_answer }
      else
        format.html { render :new }
        format.json { render json: @submitted_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submitted_answers/1
  # PATCH/PUT /submitted_answers/1.json
  def update
    respond_to do |format|
      if @submitted_answer.update(submitted_answer_params)
        format.html { redirect_to @submitted_answer, notice: 'Submitted answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @submitted_answer }
      else
        format.html { render :edit }
        format.json { render json: @submitted_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submitted_answers/1
  # DELETE /submitted_answers/1.json
  def destroy
    @submitted_answer.destroy
    respond_to do |format|
      format.html { redirect_to submitted_answers_url, notice: 'Submitted answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submitted_answer
      @submitted_answer = SubmittedAnswer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def submitted_answer_params
      params.require(:submitted_answer).permit(:user_id, :question_id, :answer, :score)
    end
end
