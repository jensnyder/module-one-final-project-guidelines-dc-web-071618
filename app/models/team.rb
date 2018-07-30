class Team < ActiveRecord::Base
  has_many :positions
  has_many :players, through: :positions
end
