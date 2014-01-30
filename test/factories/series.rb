# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :series do
    bowler
    league
    team
    week 1
    date "2014-01-11"

    factory :series_with_scores do
      ignore do
        scores_count 3
        absent false
      end

      after(:create) do |series, evaluator|
        create_list(:score, evaluator.scores_count, series: series, absent: evaluator.absent)
      end
    end
  end
end
