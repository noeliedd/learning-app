json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :name, :level, :topic_id
  json.url quiz_url(quiz, format: :json)
end
