class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
      t.string :app
      t.date :data
      t.integer :android
      t.integer :iphone
      t.integer :uninstalls
      t.integer :total_android
      t.integer :total_iphone

      t.timestamps
    end
  end
end
