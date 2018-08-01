class Player < ActiveRecord::Base
  belongs_to :team
  has_one :division, through: :team
  enum position_id: [:QB, :RB, :WR, :TE, :FB]
  enum team_id: [:ARI, :ATL, :BAL, :BUF, :CAR, :CHI, :CIN, :CLE, :DAL, :DEN, :DET, :GB, :HOU, :IND, :JAX, :KC, :LA, :LAC, :MIA, :MIN, :NE, :NO, :NYG, :NYJ, :OAK, :PHI, :PIT, :SEA, :SF, :TB, :TEN, :WAS]
end
