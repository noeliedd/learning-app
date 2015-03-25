class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @topics = Topic.where('subject_id' => current_subject.id)
    #respond_with(@topics)
  end

  def show
    @notes = Note.where(:topic_id => @topic.id)
    respond_with(@topic)
  end

  def new
    @topic = Topic.new
    #espond_with(@topic)
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params) 
    @topic.subject_id = current_subject.id
    @topic.save
    flash[:notice] = "Topic successfully created"
    redirect_to subject_path(current_subject.id)
  end

  def update
    @topic.update(topic_params)
    respond_with(@topic)
  end

  def destroy
    @topic.destroy
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
