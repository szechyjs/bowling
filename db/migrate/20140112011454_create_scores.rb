class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.integer :score
      t.references :series, index: true

      t.timestamps
    end
  end
end
