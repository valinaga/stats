class CreateAndroids < ActiveRecord::Migration
  def change
    create_table :androids do |t|
      t.string :sku
      t.date :data
      t.integer :daily_device_installs
      t.integer :active_device_installs
      t.integer :daily_user_installs
      t.integer :total_user_installs
      t.integer :active_user_installs
      t.integer :daily_device_uninstalls
      t.integer :daily_user_uninstalls
      t.integer :daily_device_upgrades

      t.timestamps
    end
  end
end
