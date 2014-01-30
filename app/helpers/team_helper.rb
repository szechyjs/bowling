module TeamHelper
  def team_handicap(team, week)
    series_bowlers = Series.where(team: team, week: week).group(:id, :bowler_id)
    series_bowlers.map(&:handicap).inject(0, :+)
  end
end
