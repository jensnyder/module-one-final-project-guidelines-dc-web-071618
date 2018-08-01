class CreateTeamstats < ActiveRecord::Migration[5.0]
  def change
    create_table :teamstats do |t|
      t.string :team_id
      t.integer :team_wins
      t.integer :team_losses
    end
  end
end
