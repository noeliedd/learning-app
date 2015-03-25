json.array!(@notes) do |note|
  json.extract! note, :id, :filename, :content_type, :file_contents, :topic_id
  json.url note_url(note, format: :json)
end
