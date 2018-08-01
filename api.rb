# require 'rest-client'
# require 'JSON'
# require 'pry'
#
# teams_from_api = RestClient.get('https://19e0f054-13f7-4ebd-8d04-5dc69f:MYSPORTSFEEDS@api.mysportsfeeds.com/v2.0/pull/nfl/2017-regular/team_stats_totals.json/')
# teams_from_api_parsed = JSON.parse(teams_from_api)
#
# teamStatsTotals_array = teams_from_api_parsed["teamStatsTotals"]
#
# teamStatsTotals_array.each do |t|
#   TeamStat.create(team_id: t["team"]["abbreviation"], team_wins: t["stats"]["standings"]["Wins"], team_losses: t["stats"]["standings"]["Losses"])
# end
