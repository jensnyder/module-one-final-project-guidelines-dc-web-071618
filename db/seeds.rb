require 'bundler'
Bundler.require
require 'JSON'
require_all 'lib'
require 'pry'
require 'rest-client'

#create divisions from divisions array
divisions = ["AFC", "NFC"]

divisions.each do |division|
  Division.create(name: division)
end

#create teams from all_teams hash and associate with divisions
all_teams = {
  ARI: {name: "Cardinals", city: "Arizona", division_id: 2},
  ATL: {name: "Falcons", city: "Atlanta", division_id: 2},
  BAL: {name: "Ravens", city: "Baltimore", division_id: 1},
  BUF: {name: "Bills", city: "Buffalo", division_id: 1},
  CAR:{ name: "Panthers", city: "Carolina", division_id: 2},
  CHI: {name: "Bears", city: "Chicago", division_id: 2},
  CIN: {name: "Bengals", city: "Cincinnati", division_id: 1},
  CLE: {name: "Browns", city: "Cleveland", division_id: 1},
  DAL: {name: "Cowboys", city: "Dallas", division_id: 2},
  DEN: {name: "Broncos", city: "Denver", division_id: 1},
  DET: {name: "Lions", city: "Detroit", division_id: 2},
  GB: {name: "Packers", city: "Green Bay", division_id: 2},
  HOU: {name: "Texans", city: "Houston", division_id: 1},
  IND: {name: "Colts", city: "Indianapolis", division_id: 1},
  JAX: {name: "Jaguars", city: "Jacksonville", division_id: 1},
  KC: {name: "Chiefs", city: "Kansas City", division_id: 1},
  LA: {name: "Rams", city: "Los Angeles", division_id: 2},
  LAC: {name: "Chargers", city: "Los Angeles", division_id: 1},
  MIA: {name: "Dolphins", city: "Miami", division_id: 1},
  MIN: {name: "Vikings", city: "Minnesota", division_id: 2},
  NE: {name: "Patriots", city: "New England", division_id: 1},
  NO: {name: "Saints", city: "New Orleans", division_id: 2},
  NYG: {name: "Giants", city: "New York", division_id: 2},
  NYJ: {name: "Jets", city: "New York", division_id: 1},
  OAK: {name: "Raiders", city: "Oakland", division_id: 1},
  PHI: {name: "Eagles", city: "Philadelphia", division_id: 2},
  PIT: {name: "Steelers", city: "Pittsburgh", division_id: 1},
  SEA: {name: "Seahawks", city: "Seattle", division_id: 2},
  SF: {name: "49ers", city: "San Francisco", division_id: 2},
  TB: {name: "Buccaneers", city: "Tampa Bay", division_id: 2},
  TEN: {name: "Titans", city: "Tennessee", division_id: 1},
  WAS: {name: "Redskins", city: "Washington", division_id: 2}}

all_teams.each do |team_id, team_info|
  Team.create(team_id: team_id, name: team_info[:name], city: team_info[:city], division_id: team_info[:division_id])
end


#create players using NflData gem
all_players = NflData::API::Player.get_all
players = JSON.parse(all_players)

players.each do |position, position_players|
  position_players.each do |player|
    Player.create(name: player["full_name"], position_id: player["position"], number: player["number"], team_id: player["team"])
  end
end

#pulls from API
teams_from_api = RestClient.get('https://19e0f054-13f7-4ebd-8d04-5dc69f:MYSPORTSFEEDS@api.mysportsfeeds.com/v2.0/pull/nfl/2017-regular/team_stats_totals.json/')
teams_from_api_parsed = JSON.parse(teams_from_api)

#teamStatsTotals array of everything
teamStatsTotals_array = teams_from_api_parsed["teamStatsTotals"]

#create teamstat object
teamStatsTotals_array.each do |t|
  Teamstat.create(team_id: t["team"]["abbreviation"],
    team_wins: t["stats"]["standings"]["Wins"],
    team_losses: t["stats"]["standings"]["Losses"],
    passpct: t["stats"]["passing"]["passPct"],
    passnetyards: t["stats"]["passing"]["passNetYards"],
    passtd: t["stats"]["passing"]["passTD"],
    rushyards: t["stats"]["rushing"]["rushYards"],
    rushtd: t["stats"]["rushing"]["rushTD"],
    receptions: t["stats"]["receiving"]["receptions"],
    interceptions: t["stats"]["interceptions"]["interceptions"],
    fumbles: t["stats"]["fumbles"]["fumbles"],
    fgpct: t["stats"]["fieldGoals"]["fgPct"],
    totaltd: t["stats"]["miscellaneous"]["totalTD"],
   )
end
