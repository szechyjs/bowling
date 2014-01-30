class AddAbsentToScore < ActiveRecord::Migration
  def change
    add_column :scores, :absent, :boolean, :default => false
  end
end
