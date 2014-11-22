require 'test_helper'

describe BowlersController do
  setup :setup_test

  it 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:bowlers)
  end

  it 'should get new' do
    get :new
    assert_response :success
  end

  it 'should create bowler' do
    bowler = build(:bowler)
    assert_difference('Bowler.count') do
      post :create, bowler: { first_name: bowler.first_name, last_name: bowler.last_name, email: bowler.email }
    end
    flash[:notice].must_equal 'Bowler was successfully created.'
    assert_redirected_to bowler_path(assigns(:bowler))
  end

  it 'should show bowler' do
    get :show, id: @bowler
    assert_response :success
  end

  it 'should get edit' do
    get :edit, id: @bowler
    assert_response :success
  end

  it 'should update bowler' do
    patch :update, id: @bowler, bowler: { first_name: @bowler.first_name, last_name: @bowler.last_name, email: @bowler.email }
    flash[:notice].must_equal 'Bowler was successfully updated.'
    assert_redirected_to bowler_path(assigns(:bowler))
  end

  it 'should destroy bowler' do
    assert_difference('Bowler.count', -1) do
      delete :destroy, id: @bowler
    end
    flash[:notice].must_equal 'Bowler was successfully destroyed.'
    assert_redirected_to bowlers_path
  end

  private

  def setup_test
    sign_in create(:user)
    @bowler = create(:bowler)
  end
end
