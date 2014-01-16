require 'test_helper'

describe LeaguesController do
  setup :setup_test

  it "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leagues)
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create league" do
    league = build(:league)
    assert_difference('League.count') do
      post :create, league: { name: league.name, start_date: league.start_date }
    end

    assert_redirected_to league_path(assigns(:league))
  end

  it "should show league" do
    get :show, id: @league
    assert_response :success
  end

  it "should get edit" do
    get :edit, id: @league
    assert_response :success
  end

  it "should update league" do
    patch :update, id: @league, league: { name: @league.name, start_date: @league.start_date }
    assert_redirected_to league_path(assigns(:league))
  end

  it "should destroy league" do
    assert_difference('League.count', -1) do
      delete :destroy, id: @league
    end

    assert_redirected_to leagues_path
  end

  it "should show stats" do
    create(:series_with_scores, league: @league)
    get :stats, id: @league
    assert_response :success
  end

  it "should show week stats" do
    get :week, id: @league, week: 1
    assert_response :success
  end

  private

  def setup_test
    sign_in create(:user)
    @league = create(:league)
  end
end
