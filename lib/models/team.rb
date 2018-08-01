class Team < ActiveRecord::Base
  self.primary_key = "team_id"
  belongs_to :division
  has_many :players
end
