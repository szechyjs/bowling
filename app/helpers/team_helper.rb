module TeamHelper
  def team_handicap(team, week)
    total = 0
    series_bowlers = Series.where(team: team, week: week).group(:bowler_id)
    series_bowlers.each do |series|
      total += bowler_handicap series.bowler, team, week
    end
    total
  end
end
