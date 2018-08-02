class AddColumnsToTeamstats < ActiveRecord::Migration[5.0]
  def change
    add_column :teamstats, :passpct, :float
    add_column :teamstats, :passnetyards, :integer
    add_column :teamstats, :passtd, :integer
    add_column :teamstats, :rushyards, :integer
    add_column :teamstats, :rushtd, :integer
    add_column :teamstats, :receptions, :integer
    add_column :teamstats, :interceptions, :integer
    add_column :teamstats, :fumbles, :integer
    add_column :teamstats, :fgpct, :float
    add_column :teamstats, :totaltd, :integer
  end
end
