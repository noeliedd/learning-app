class Topic < ActiveRecord::Base
  belongs_to :subject
  has_many :note, :dependent => :destroy
  validates_presence_of :name
end
