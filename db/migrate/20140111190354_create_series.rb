class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.references :bowler, index: true
      t.references :league, index: true
      t.references :team, index: true
      t.integer :week
      t.date :date

      t.timestamps
    end
  end
end
