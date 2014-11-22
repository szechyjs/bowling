require 'test_helper'

class TeamsTest < ActionDispatch::IntegrationTest
  setup :setup_test
  teardown { Warden.test_reset! }

  describe 'index action' do
    it 'includes teams' do
      visit teams_path
      page.must_have_content('Team 1')
      page.must_have_content('Team 2')
    end
  end

  describe 'create action' do
    setup do
      visit teams_path
      click_on 'New'
    end

    it 'requires name' do
      click_on 'Create Team'
      page.must_have_content("Name can't be blank")
    end
  end

  private

  def setup_test
    create(:team, name: 'Team 1')
    create(:team, name: 'Team 2')
    user = create(:user)
    login_as user
  end
end
