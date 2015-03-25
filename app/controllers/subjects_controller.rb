class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @subjects = Subject.all
    #respond_with(@subjects)
  end

  def show
    @notes = Note.all
    @topics = Topic.where(:subject_id => @subject.id)     
    #respond_with(@subject)
  end

  def new
    @subject = Subject.new
    respond_with(@subject)
  end

  def edit
  end

  def create
    @subject = Subject.new(subject_params)
    @subject.save
    flash[:notice] = "Subject Successfully Added"
    redirect_to subjects_path
  end

  def update
    @subject.update(subject_params)
    respond_with(@subject)
  end

  def destroy
    @subject.destroy
    respond_with(@subject)
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
      session[:current_subject] = @subject.id
    end

    def subject_params
      params.require(:subject).permit(:name)
    end
end
