class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.integer :team_id
      t.integer :player_id
      t.string :name
    end
  end
end
