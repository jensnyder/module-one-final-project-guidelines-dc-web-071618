class Player < ActiveRecord::Base
  has_one :position
  has_one :team, through: :position
end
