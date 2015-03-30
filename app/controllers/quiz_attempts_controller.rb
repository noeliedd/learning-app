class QuizAttemptsController < ApplicationController
  before_action :set_quiz_attempt, only: [:show, :edit, :update, :destroy]
  before_action :set_quiz, only:[:new]
  # GET /quiz_attempts
  # GET /quiz_attempts.json
  def index
    @quiz_attempts = QuizAttempt.all
  end

  # GET /quiz_attempts/1
  # GET /quiz_attempts/1.json
  def show
  end

  # GET /quiz_attempts/new
  def new
    @questions = Question.where('quiz_id' => params[:quiz_id])
    @quiz_attempt = QuizAttempt.new
    @quiz_attempt.quiz_id = current_quiz.id
    @quiz_attempt.user_id = current_user.id  
  end

  # GET /quiz_attempts/1/edit
  def edit
  end

  # POST /quiz_attempts
  # POST /quiz_attempts.json
  def create   
    puts"Here is the total 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    puts"Here is the total 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    puts"Here is the total 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
    total = Question.where('quiz_id' => current_quiz.id).count
    #puts  "Let's talk about #{total}."
    if params[:user_picks].nil?
      redirect_to new_quiz_attempt_path(quiz_id: current_quiz.id), :flash => { :error => 'Nothing submitted' } 
    else
      check_answers(params[:user_picks],params[:correct_answers])
      #@user_picks = params[:user_picks]
     # @correct_answers = params[:correct_answers]
     # @user_picks.zip(@correct_answers).each do |user_picks, correct_answers|
     #   if user_picks == correct_answers
     #     puts"Yes"
     #   else
     #     puts "No"
     #   end
     #end
      
      puts"Here is the params 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000"
      puts params.inspect
      @quiz_attempt = QuizAttempt.new(quiz_attempt_params)

      respond_to do |format|
        if @quiz_attempt.save
          format.html { redirect_to subject_path(current_subject.id), notice: 'Quiz attempt was successfully created.' }
          format.json { render :show, status: :created, location: @quiz_attempt }
        else
          format.html { render :new }
          format.json { render json: @quiz_attempt.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /quiz_attempts/1
  # PATCH/PUT /quiz_attempts/1.json
  def update
    respond_to do |format|
      if @quiz_attempt.update(quiz_attempt_params)
        format.html { redirect_to @quiz_attempt, notice: 'Quiz attempt was successfully updated.' }
        format.json { render :show, status: :ok, location: @quiz_attempt }
      else
        format.html { render :edit }
        format.json { render json: @quiz_attempt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quiz_attempts/1
  # DELETE /quiz_attempts/1.json
  def destroy
    @quiz_attempt.destroy
    respond_to do |format|
      format.html { redirect_to quiz_attempts_url, notice: 'Quiz attempt was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
   def set_quiz
      @quiz = Quiz.find_by_id(params[:quiz_id])
      session[:current_quiz] = @quiz.id
    end  
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_attempt
      @quiz_attempt = QuizAttempt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_attempt_params
      params.require(:quiz_attempt).permit(:user_id, :quiz_id, :mark)
    end
end
