class AddUpgradesToItunes < ActiveRecord::Migration
  def change
    add_column :itunes, :upgrades, :integer

  end
end
