class QuizzesController < ApplicationController  
  #before_filter :authenticate_user!
  before_filter :is_admin?

  def is_admin?
    if current_user.admin?
      true
    else
      @quizzes = Quiz.where(:topic => [1..current_user.level]) 
      respond_with(@quizzes)
    end
  end
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    #@quizzes = Quiz.where(topic: params[:level])
    @quizzes = Quiz.all
    respond_with(@quizzes)
  end

  def show
    respond_with(@quiz)
  end

  def new
    @quiz = Quiz.new
    respond_with(@quiz)
  end

  def edit
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
    redirect_to new_quiz_path
    else
    render :action => 'new'  
    end
  end

  def update
    @quiz.update(quiz_params)
    respond_with(@quiz)
  end

  def destroy
    @quiz.destroy
    respond_with(@quiz)
  end

  private
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(:title, :topic, :question, :ans1, :ans2, :ans3, :ans4, :correctAns)
    end
end
