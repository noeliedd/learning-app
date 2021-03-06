class Topic < ActiveRecord::Base
  belongs_to :subject
  has_many :note, :dependent => :destroy
  has_many :quiz, :dependent => :destroy
  has_many :quiz_attempt
  validates_presence_of :name, :subject_id
end
