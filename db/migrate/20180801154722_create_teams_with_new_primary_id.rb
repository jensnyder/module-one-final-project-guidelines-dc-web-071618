class CreateTeamsWithNewPrimaryId < ActiveRecord::Migration[5.0]
  def change
    create_table :teams, id: false do |t|
      t.string :team_id, null: false
      t.string :name
      t.string :city
    end
    add_index :teams, :team_id, unique: true
  end
end
