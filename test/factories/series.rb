# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :series do
    bowler nil
    league nil
    team nil
    week 1
    date "2014-01-11"
  end
end
