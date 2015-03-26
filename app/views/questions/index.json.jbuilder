json.array!(@questions) do |question|
  json.extract! question, :id, :question, :ans1, :ans2, :ans3, :correctAnswer, :quiz_id
  json.url question_url(question, format: :json)
end
