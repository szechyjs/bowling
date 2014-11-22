require 'test_helper'

class LeaguesTest < ActionDispatch::IntegrationTest
  setup :setup_test
  teardown { Warden.test_reset! }

  describe 'index action' do
    it 'includes leagues' do
      visit leagues_path
      page.must_have_content('Test 1')
      page.must_have_content('Test 2')
    end
  end

  describe 'create action' do
    setup do
      visit leagues_path
      click_on 'New'
    end

    it 'requires name' do
      click_on 'Create League'
      page.must_have_content("Name can't be blank")
    end

    it 'requires start date' do
      click_on 'Create League'
      page.must_have_content("Start datecan't be blank")
    end
  end

  private

  def setup_test
    create(:league, name: 'Test 1')
    create(:league, name: 'Test 2')
    user = create(:user)
    login_as user
  end
end
