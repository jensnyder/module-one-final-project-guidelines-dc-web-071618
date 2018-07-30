class RemovePlayerIdAndTeamIdFromPositions < ActiveRecord::Migration[5.0]
  def change
    remove_column :positions, :player_id
    remove_column :positions, :team_id
  end
end
