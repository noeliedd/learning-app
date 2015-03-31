class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  # GET /notes
  # GET /notes.json
  def index
    @notes = Note.all
  end

  # GET /notes/1
  # GET /notes/1.json
def show
    send_data( Base64.decode64(@note.file_contents),
    type: @note.content_type,
    filename: @note.filename)
end

  # GET /notes/new
  def new
    if current_user.admin?
      @note = Note.new
      @note.topic_id = params[:topic_id]
    else
      flash[:notice] = "You do not have permission to access this page"
      redirect_to root_path
    end   
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)
    @note.subject_id = current_subject.id
    @note.save
    #@note.topic_id = current_topic.id
    respond_to do |format|
      if @note.save
        format.html { redirect_to subject_path(current_subject.id), notice: 'Notes uploaded successfully.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html {redirect_to subject_path(current_subject.id), notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:file, :topic_id, :subject_id)
    end
end
