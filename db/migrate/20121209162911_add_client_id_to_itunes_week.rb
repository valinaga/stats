class AddClientIdToItunesWeek < ActiveRecord::Migration
  def change
    add_column :itunes_weeks, :client_id, :integer

  end
end
