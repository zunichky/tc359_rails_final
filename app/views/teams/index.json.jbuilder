json.array!(@teams) do |team|
  json.extract! team, :id, :name, :gamesPlayed, :wins, :losses, :otLosses, :points, :nhlTeam
  json.url team_url(team, format: :json)
end
