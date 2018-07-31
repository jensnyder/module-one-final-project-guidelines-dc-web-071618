class AddDivisionIdToTeams < ActiveRecord::Migration[5.0]
  def change
    add_column :teams, :division_id, :integer
  end
end
