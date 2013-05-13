class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :distance
      t.string :calories

      t.timestamps
    end
  end
end
