json.array!(@bowlers) do |bowler|
  json.extract! bowler, :id
  json.url bowler_url(bowler, format: :json)
end
