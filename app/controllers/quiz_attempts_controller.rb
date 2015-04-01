class QuizAttemptsController < ApplicationController
  before_action :set_quiz_attempt, only: [:show, :edit, :update, :destroy]
  
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
    @topic = Topic.find_by_id(params[:topic_id])
    level = Userquizattempt.getquiz(@topic, current_user.id)
    @quiz = Quiz.where(topic_id: params[:topic_id].to_i, level: level.to_s).first
    @questions = Question.where(quiz_id: @quiz.id)
    @quiz_attempt = QuizAttempt.new
    @quiz_attempt.quiz_id = @quiz.id
    @quiz_attempt.user_id = current_user.id 
    @quiz_attempt.topic_id = params[:topic_id]
    @quiz_attempt.level = level    
    session[:current_quiz] = @quiz.id
  end

  # GET /quiz_attempts/1/edit
  def edit
  end

  # POST /quiz_attempts
  # POST /quiz_attempts.json
  def create   
    if params[:user_picks].nil?
         redirect_to subject_path(current_subject.id), :flash => { :error => 'Nothing submitted' } 
    else
      #Get Total questions relating to quiz_id
      total_questions = Question.where('quiz_id' => current_quiz.id).count
      puts"Here comes the count"
      puts total_questions
      #Call get_mark method in module to return users mark
      mark = Checkquiz.getmark(params[:user_picks],params[:correct_answers],total_questions)

        @quiz_attempt = QuizAttempt.new(quiz_attempt_params)
        if mark > 70
          @quiz_attempt.passed = true
        end
        @quiz_attempt.mark = mark

        respond_to do |format|
          if @quiz_attempt.save
            format.html { redirect_to subject_path(current_subject.id), notice: "Quiz completed. You scored #{'%.00f' % mark} percent for this attempt"  }
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

    # Use callbacks to share common setup or constraints between actions.
    def set_quiz_attempt
      @quiz_attempt = QuizAttempt.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quiz_attempt_params
      params.require(:quiz_attempt).permit(:user_id, :quiz_id,:level,:passed,:topic_id,:mark)
    end
end
