require 'test_helper'

class BowlersTest < ActionDispatch::IntegrationTest
  setup :setup_test
  teardown { Warden.test_reset! }

  describe 'index action' do
    it 'includes bowlers' do
      create(:bowler)
      create(:bowler, first_name: 'Jane')
      visit bowlers_path
      page.must_have_content('John Doe')
      page.must_have_content('Jane Doe')
    end
  end

  describe 'create action' do
    setup do
      visit bowlers_path
      click_on 'New'
    end

    it 'requires name' do
      click_on 'Create Bowler'
      page.must_have_content("First name can't be blank")
      page.must_have_content("Last name can't be blank")
    end

    it 'requires email' do
      click_on 'Create Bowler'
      page.must_have_content("Email can't be blank")
    end

    it 'requires unique email' do
      create(:bowler, email: 'test@example.com')
      fill_in 'Email', with: 'test@example.com'
      click_on 'Create Bowler'
      page.must_have_content('Email has already been taken')
    end

    describe 'with valid bowler' do
      let(:bowler) { build(:bowler) }
      setup do
        fill_in 'First name', with: bowler.first_name
        fill_in 'Last name', with: bowler.last_name
        fill_in 'Email', with: bowler.email
        click_on 'Create Bowler'
      end

      it 'says the record was created' do
        page.must_have_content('Bowler was successfully created')
      end

      it 'redirects to show page' do
        current_path.must_equal(bowler_path(Bowler.last))
      end

      it 'has bowler name' do
        page.must_have_content(bowler.first_name)
        page.must_have_content(bowler.last_name)
      end

      it 'has bowler email' do
        page.must_have_content(bowler.email)
      end
    end
  end

  private

  def setup_test
    user = create(:user)
    login_as user
  end
end
