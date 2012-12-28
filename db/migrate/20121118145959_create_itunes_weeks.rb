class CreateItunesWeeks < ActiveRecord::Migration
  def change
    create_table :itunes_weeks do |t|
      t.string :sku
      t.string :title
      t.integer :units
      t.integer :upgrades
      t.date :date_stat
      t.date :date_end
      t.string :country

      t.timestamps
    end
  end
end
