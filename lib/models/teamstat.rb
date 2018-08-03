class Teamstat < ActiveRecord::Base
  belongs_to :team

  def self.get_max(string)
    max = Teamstat.maximum(string)
    teamstat_max = Teamstat.find_by string.to_sym => max
    id = teamstat_max.team_id
    team_max = Team.find(id)
    puts "\nThe #{team_max.city} #{team_max.name} (#{max})".blue
  end

  def self.get_min(string)
    min = Teamstat.minimum(string)
    teamstat_min = Teamstat.find_by string.to_sym => min
    id = teamstat_min.team_id
    team_min = Team.find(id)
    puts "\nThe #{team_min.city} #{team_min.name} (#{min})".blue
  end

  def self.order_teamstats_by(string)
    Teamstat.order(string)
  end

end
