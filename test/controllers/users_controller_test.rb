require 'test_helper'

describe Users::OmniauthCallbacksController do
  setup :setup_test

  it 'should authenticate a new user' do
    assert_difference 'User.count', +1 do
      get :google_oauth2
    end
    User.last.email.must_equal 'joe@example.com'
    assert_redirected_to root_path
  end

  it 'should authenticate an existing user' do
    create(:user, email: 'joe@example.com')
    assert_no_difference 'User.count' do
      get :google_oauth2
    end
    assert_redirected_to root_path
  end

  private

  def setup_test
    request.env['devise.mapping'] = Devise.mappings[:user]
    request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
  end

end
