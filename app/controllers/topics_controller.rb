class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @topics = Topic.where('subject_id' => current_subject.id)
  end

  def show
    @notes = Note.where(:topic_id => @topic.id)
    @quizzes = Quiz.where(:topic_id => @topic.id)
    respond_with(@topic)
  end

  def new
    @topic = Topic.new
  end

  def edit
    @topics = Topic.where('topic_name' => @topic.name) 
  end

  def create
    @topic = Topic.new(topic_params) 
    @topic.subject_id = current_subject.id
    if @topic.save
      flash[:notice] = "Topic successfully added"
      redirect_to subject_path(current_subject.id)
    else
      flash[:notice] = "Name cannot be blank"
      redirect_to new_topic_path(current_subject.id)
    end
  end

  def update
    @topic.update(topic_params)
    flash[:notice] = "Topic name updated"
    redirect_to subject_path(current_subject.id)
  end

  def destroy
    @topic.destroy
    flash[:notice] = "Topic Deleted"
    redirect_to subject_path(current_subject.id)
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
      session[:current_topic] = @topic.id
    end

    def topic_params
      params.require(:topic).permit(:name)
    end
end
