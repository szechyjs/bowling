require 'test_helper'

describe TeamHelper do
  include BowlerHelper

  it "calculates the team handicap for week 1" do
    t = create(:team_of_bowlers)
    a = create(:series_with_scores, team: t, bowler: t.bowlers[0])
    create(:series_with_scores, league: a.league, team: a.team, bowler: t.bowlers[1])
    create(:series_with_scores, league: a.league, team: a.team, bowler: t.bowlers[2])
    create(:series_with_scores, league: a.league, team: a.team, bowler: t.bowlers[3])
    handicap = team_handicap a.team, 1
    handicap.must_equal 216
  end
end
