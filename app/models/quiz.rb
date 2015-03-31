class Quiz < ActiveRecord::Base
  belongs_to :topic
  has_many :question, :dependent => :destroy
  has_many :quiz_attempts, :dependent => :destroy
  validates_presence_of :name, :level, :topic_id
  validates_uniqueness_of :level, :scope => [:topic_id]
end
