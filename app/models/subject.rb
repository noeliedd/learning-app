class Subject < ActiveRecord::Base
  has_many :topics, :dependent => :destroy
end
