class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :distance
      t.string :calories
      t.string :title
      t.string :speed
      t.timestamps
    end
  end
end
