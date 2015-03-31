module Check_Quiz
  def get_mark(user_answers, correct_answers, total_questions)
    correct = 0.0
    x = 0
    for i in 1..total_questions      
      if user_answers[x] == correct_answers[x]
        correct = correct +1    
      end
      x = x+1
    end    
    mark = (correct/total_questions) * 100
    puts mark
    return mark
  end
end