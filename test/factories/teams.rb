# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    name 'Strikes'
    league

    factory :team_of_bowlers do
      ignore do
        bowler_count 4
      end

      after(:create) do |team, evaluator|
        create_list(:bowler, evaluator.bowler_count, team: team)
      end
    end
  end
end
