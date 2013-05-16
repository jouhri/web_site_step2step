class Training < ActiveRecord::Base
  attr_accessible :calories, :distance, :speed, :user_id, :created_at, :title
  belongs_to :user
end
