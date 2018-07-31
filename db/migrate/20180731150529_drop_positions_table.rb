class DropPositionsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :positions
  end
end
