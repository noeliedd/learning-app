module User_Quiz_Attempt
  def getquiz(topic, user)
    attempt = QuizAttempt.find_by(user_id: user, topic_id: topic.id, level: "Easy", passed: true)
    if (attempt).nil?
      return "Easy"
    else
      attempt = QuizAttempt.find_by(user_id: user, topic_id: topic.id, level: "Medium", passed: true)
      if (attempt).nil?
        return "Medium"
      else
        return "Hard"
      end
    end
  end
end