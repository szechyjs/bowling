class AddNicknameToBowler < ActiveRecord::Migration
  def change
    add_column :bowlers, :nickname, :string
  end
end
