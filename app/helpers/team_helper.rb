module TeamHelper
  def team_handicap(team, week)
    total = 0
    team.bowlers.each do |bowler|
      total += bowler_handicap bowler, team, week
    end
    total
  end
end
