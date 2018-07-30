class Position < ActiveRecord::Base
  belongs_to :teams
  belongs_to :players
end
