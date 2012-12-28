class CreateItunes < ActiveRecord::Migration
  def change
    create_table :itunes do |t|
      t.string :sku
      t.string :title
      t.integer :units
      t.date :data
      t.string :country

      t.timestamps
    end
  end
end
