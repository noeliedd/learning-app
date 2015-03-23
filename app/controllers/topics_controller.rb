class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @topics = Topic.all
    respond_with(@topics)
  end

  def show
    respond_with(@topic)
  end

  def new
    puts params.inspect
    @topic = Topic.new
    @topic.subject_id = params[:subject_id]
    #respond_with(@topic)
  end

  def edit
  end

  def create
    @topic = Topic.new(topic_params)    
    @topic.save
    flash[:notice] = "Topic successfully created"
    redirect_to new_topic_path
  end

  def update
    @topic.update(topic_params)
    respond_with(@topic)
  end

  def destroy
    @topic.destroy
    respond_with(@topic)
  end

  private
    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:name, :subject_id)
    end
end