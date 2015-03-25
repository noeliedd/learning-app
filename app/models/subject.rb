class Subject < ActiveRecord::Base
  has_many :topic, :dependent => :destroy
  validates_presence_of :name
end
