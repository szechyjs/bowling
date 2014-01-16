class AddHandicapToLeague < ActiveRecord::Migration
  def change
    add_column :leagues, :basis, :integer
    add_column :leagues, :percentage, :integer
  end
end
