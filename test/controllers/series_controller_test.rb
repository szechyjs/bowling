require 'test_helper'

describe SeriesController do
  setup :setup_test

  it 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:series)
  end

  it 'should get new' do
    get :new
    assert_response :success
  end

  it 'should create series' do
    assert_difference('Series.count') do
      post :create, series: { bowler_id: @series.bowler.id }
    end
    flash[:notice].must_equal 'Series was successfully created.'
    assert_redirected_to series_path(assigns(:series))
  end

  it 'should show series' do
    get :show, id: @series
    assert_response :success
  end

  it 'should get edit' do
    get :edit, id: @series
    assert_response :success
  end

  it 'should update series' do
    patch :update, id: @series, series: { bowler_id: @series.bowler.id }
    flash[:notice].must_equal 'Series was successfully updated.'
    assert_redirected_to series_path(assigns(:series))
  end

  it 'should destroy series' do
    assert_difference('Series.count', -1) do
      delete :destroy, id: @series
    end
    flash[:notice].must_equal 'Series was successfully destroyed.'
    assert_redirected_to series_index_path
  end

  it 'should get next week' do
    xhr :get, :next_week, format: 'js', bowler: @series.bowler.id, league: @series.league.id, team: @series.team.id
    response.content_type.must_equal Mime::JS
    response.body.must_include "val('2')"
  end

  private

  def setup_test
    sign_in create(:user)
    @series = create(:series_with_scores)
  end
end
