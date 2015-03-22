json.array!(@quizzes) do |quiz|
  json.extract! quiz, :id, :title, :topic, :question, :ans1, :ans2, :ans3, :ans4, :correctAns
  json.url quiz_url(quiz, format: :json)
end
