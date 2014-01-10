class CreateLeagues < ActiveRecord::Migration
  def change
    create_table :leagues do |t|
      t.string :name
      t.string :day
      t.date :start_date
      t.integer :weeks

      t.timestamps
    end
  end
end
