require 'test_helper'

describe BowlerHelper do
  it "calculates handicap for week 1" do
    s = create(:series_with_scores)
    handicap = bowler_handicap s.bowler, s.team, 1
    handicap.must_equal 54
  end

  it "calculates handicap for week x" do
    s = create(:series_with_scores)
    create(:series_with_scores, bowler: s.bowler, team: s.team, league: s.league, week: 2)
    handicap = bowler_handicap s.bowler, s.team, 2
    handicap.must_equal 54
  end

  it "calculates handicap for week 2 with no week 1" do
    s = create(:series_with_scores, week: 2)
    handicap = bowler_handicap s.bowler, s.team, 2
    handicap.must_equal 54
  end
end
