class AddPositionIdAndTeamIdToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :position_id, :integer
    add_column :players, :team_id, :integer
  end
end
