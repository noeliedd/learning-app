class Question < ActiveRecord::Base
  belongs_to :quiz
  validates_presence_of :question, :ans1, :ans2, :ans3, :correctAnswer, :quiz_id
end
