require 'test_helper'

describe TeamsController do
  setup :setup_test

  it "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teams)
  end

  it "should get new" do
    get :new
    assert_response :success
  end

  it "should create team" do
    assert_difference('Team.count') do
      post :create, team: { name: @team.name }
    end

    assert_redirected_to team_path(assigns(:team))
  end

  it "should show team" do
    get :show, id: @team
    assert_response :success
  end

  it "should get edit" do
    get :edit, id: @team
    assert_response :success
  end

  it "should update team" do
    patch :update, id: @team, team: { name: @team.name  }
    assert_redirected_to team_path(assigns(:team))
  end

  it "should destroy team" do
    assert_difference('Team.count', -1) do
      delete :destroy, id: @team
    end

    assert_redirected_to teams_path
  end

  private

  def setup_test
    sign_in create(:user)
    @team = create(:team)
  end
end
