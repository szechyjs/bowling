class CreateBowlers < ActiveRecord::Migration
  def change
    create_table :bowlers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, :null => false
      t.references :team, index: true

      t.timestamps
    end

    add_index :bowlers, :email, :unique => true
  end
end
