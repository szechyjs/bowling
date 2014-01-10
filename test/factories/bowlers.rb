# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bowler do
    first_name "First"
    last_name "Last"
    sequence(:email) { |n| "bowler#{n}@example.com" }
    team
  end
end
