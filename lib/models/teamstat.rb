class Teamstat < ActiveRecord::Base
  belongs_to :team

  def self.get_max(string)
    max = Teamstat.maximum(string)
    teamstat_max = Teamstat.find_by string.to_sym => max
    id = teamstat_max.team_id
    team_max = Team.find(id)
    puts "\n" + team_max.name.cyan
  end

end
