module BowlerHelper
  def bowler_handicap(bowler, team, week)
    weeks = Series.select(:id, :week).where(bowler: bowler, team: team).order(:week)
    if week == weeks.first.week
      series = Series.where(bowler: bowler, week: week, team: team).first
      average = series.average
    else
      series = Series.where(bowler: bowler, week: 1..(week-1), team: team)
      games = 0
      total = 0.0
      series.each do |aseries|
        total += aseries.total
        games += aseries.scores.count
      end
      average = (total / games).floor
    end
      handicap = (team.league.basis - average) * team.league.percentage_decimal
      handicap.floor
  end
end
