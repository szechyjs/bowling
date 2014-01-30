require 'test_helper'

describe Series do
  it "computes the total and average of a series" do
    series = create(:series_with_scores)
    series.total.must_equal 450
    series.average.must_equal 150
    series.games.must_equal 3
    series.handicap_total.must_equal 450
    series.handicap_average.must_equal 150
    series.handicap_games.must_equal 3
  end

  it "computes the total and average of an absent series" do
    series = create(:series_with_scores, absent: true)
    series.total.must_equal 450
    series.average.must_equal 150
    series.games.must_equal 3
    series.handicap_total.must_equal 0
    series.handicap_average.must_equal 0
    series.handicap_games.must_equal 0
  end

  it "computes the totals and average of empty series" do
    series = create(:series)
    series.total.must_equal 0
    series.average.must_equal 0
    series.games.must_equal 0
    series.handicap_total.must_equal 0
    series.handicap_average.must_equal 0
    series.handicap_games.must_equal 0
  end

end
