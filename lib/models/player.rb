class Player < ActiveRecord::Base
  belongs_to :team
  has_one :division, through: :team
  enum position_id: [:qb, :rb, :wr, :te, :k]
end
