class Note < ActiveRecord::Base
  belongs_to :topic
  validates_presence_of :filename, :subject_id, :topic_id
  
  require 'base64'
  def initialize(params = {})
    file = params.delete(:file)
    super
    if file
      self.filename = sanitize_filename(file.original_filename)
      self.content_type = file.content_type
      self.file_contents = Base64.encode64(file.read)
    end
  end
  private
    def sanitize_filename(filename)
      return File.basename(filename)
    end
end
