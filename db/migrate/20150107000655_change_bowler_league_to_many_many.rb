class ChangeBowlerLeagueToManyMany < ActiveRecord::Migration
  def change
    create_join_table :bowlers, :teams  do |t|
      t.index :bowler_id
      t.index :team_id
    end

    execute "INSERT INTO bowlers_teams SELECT id, team_id FROM bowlers;"

    remove_column :bowlers, :team_id

  end
end
