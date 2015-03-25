class Subject < ActiveRecord::Base
  has_many :topic, :dependent => :destroy
end
