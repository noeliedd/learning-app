class Quiz < ActiveRecord::Base
  validates_presence_of :title,:topic,:question,:ans1,:ans2,:ans3,:ans4,:correctAns;
end
