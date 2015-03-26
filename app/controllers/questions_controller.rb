class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :set_quiz, only:[:index]
  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.where('quiz_id' => params[:quiz_id])
  end

  # GET /questions/1
  # GET /questions/1.json
  def show    
    
  end

  # GET /questions/new
  def new
    @question = Question.new
    @question.quiz_id = current_quiz.id
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
    #@question.topic = current_topic.id
    respond_to do |format|
      if @question.save
        format.html { redirect_to new_question_path(current_quiz.id), notice: 'Question added.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      puts("Here comes the puts")
      puts(@question.quiz_id)
      if @question.update(question_params)
        format.html { redirect_to questions_path(quiz_id: @question.quiz_id), notice: 'Question updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_path(quiz_id: @question.quiz_id), notice: 'Question deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end
  
    def set_quiz
      @quiz = Quiz.find_by_id(params[:quiz_id])
      session[:current_quiz] = @quiz.id
    end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:question, :ans1, :ans2, :ans3, :correctAnswer, :quiz_id)
    end
end
