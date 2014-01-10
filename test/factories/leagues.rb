# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :league do
    name "A League"
    day "Wednesday"
    start_date "2014-01-09"
    weeks 12
  end
end
