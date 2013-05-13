class Training < ActiveRecord::Base
  attr_accessible :calories, :distance
  belongs_to :user
end
