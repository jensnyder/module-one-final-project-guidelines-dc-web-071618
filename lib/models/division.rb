class Division < ActiveRecord::Base
  has_many :teams
  has_many :players, through: :teams

  def self.find_division(division)
    Division.find_by(name: division)
  end

  def find_teams_in_division
    Team.find_teams_by_divison(self)
  end

  def get_ordered_teamstats_of_division(string)
    team_ids = find_teams_in_division.map {|t| t.team_id}
    ts = Teamstat.where(:team_id => team_ids)
    ts.order(string)
  end

  def get_max_team_name_of_division(string)
    ts = get_ordered_teamstats_of_division(string)[-1]
    id = ts.team_id
    team_max = Team.find(id)
    puts "\nThe #{team_max.name}".blue
  end

end
