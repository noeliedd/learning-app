json.array!(@quiz_attempts) do |quiz_attempt|
  json.extract! quiz_attempt, :id, :user_id, :quiz_id, :mark
  json.url quiz_attempt_url(quiz_attempt, format: :json)
end
