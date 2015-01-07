# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bowler do
    first_name 'John'
    last_name 'Doe'
    sequence(:email) { |n| "bowler#{n}@example.com" }
  end

  factory :bowler_with_team, parent: :bowler do
    teams {[FactoryGirl.create(:team)]}
  end
end
