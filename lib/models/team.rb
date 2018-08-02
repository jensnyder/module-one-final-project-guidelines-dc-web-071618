class Team < ActiveRecord::Base
  self.primary_key = "team_id"
  belongs_to :division
  has_many :players
  has_one :teamstat

  def self.find_team(team)
    Team.find_by(name: team)
  end

  def self.find_teams_by_divison(division)
    Team.where("division_id = ?", division.id)
  end

  def self.show_teams(teams)
    team_names = teams.map do |team|
      team.name
    end
    puts "The teams in this division are: #{team_names}"
  end

  def find_players
    self.players
  end

  def show_players
    player_names = self.find_players
    player_names = players.map do |player|
      player.name
    end
    puts "The players on this team are: #{player_names}"
  end

  def show_stats_from_team_name
    team_instance = Team.find_team(self.name)
    teamstat = Teamstat.find_by team_id: team_instance.team_id
    puts "The stats for this team are wins: #{teamstat.team_wins} and losses: #{teamstat.team_losses}"
  end

end
