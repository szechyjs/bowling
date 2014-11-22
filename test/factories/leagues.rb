# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :league do
    name 'A League'
    start_date '2014-01-09'
    weeks 12
    basis 210
    percentage 90
  end
end
