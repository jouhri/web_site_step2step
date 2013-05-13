class AddTrainingIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :training_id, :int
  end
end
