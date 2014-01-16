require 'test_helper'

describe Team do
  it "has a string version" do
    build(:team).to_s.must_equal "Strikes - A League - January 2014"
  end

  it "computes team stats with one week" do
    team = create(:team)
    create(:series_with_scores, team: team)
    create(:series_with_scores, team: team)
    create(:series_with_scores, team: team)
    create(:series_with_scores, team: team)
    team_stats = team.stats
    team_stats.wont_be_nil
    team_stats[:scratch_pins].must_equal 1800
    team_stats[:high_game].total.must_equal 450
    team_stats[:high_series_pins].must_equal 1800
    team_stats[:high_series_week].must_equal 1
  end

  it "computes team stats with first week being best" do
    team = create(:team)
    create(:series_with_scores, team: team)
    create(:series_with_scores, team: team)
    create(:series_with_scores, team: team)
    create(:series_with_scores, team: team)
    create(:series_with_scores, team: team, week: 2)
    create(:series_with_scores, team: team, week: 2)
    create(:series_with_scores, team: team, week: 2)
    team_stats = team.stats
    team_stats.wont_be_nil
    team_stats[:scratch_pins].must_equal 3150
    team_stats[:high_game].total.must_equal 450
    team_stats[:high_series_pins].must_equal 1800
    team_stats[:high_series_week].must_equal 1
  end

  it "computes team stats with last week being best" do
    team = create(:team)
    create(:series_with_scores, team: team)
    create(:series_with_scores, team: team)
    create(:series_with_scores, team: team)
    create(:series_with_scores, team: team, week: 2)
    create(:series_with_scores, team: team, week: 2)
    create(:series_with_scores, team: team, week: 2)
    create(:series_with_scores, team: team, week: 2)
    team_stats = team.stats
    team_stats.wont_be_nil
    team_stats[:scratch_pins].must_equal 3150
    team_stats[:high_game].total.must_equal 450
    team_stats[:high_series_pins].must_equal 1800
    team_stats[:high_series_week].must_equal 2
  end
end
