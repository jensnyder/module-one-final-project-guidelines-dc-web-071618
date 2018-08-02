class Division < ActiveRecord::Base
  has_many :teams
  has_many :players, through: :teams

  def self.find_division(division)
    Division.find_by(name: division)
  end

end
