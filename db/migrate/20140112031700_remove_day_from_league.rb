class RemoveDayFromLeague < ActiveRecord::Migration
  def change
    remove_column :leagues, :day
  end
end
