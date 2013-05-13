class AddUserIdToTrainings < ActiveRecord::Migration
  def change
    add_column :trainings, :user_id, :int
  end
end
