class AddClientIdToItunes < ActiveRecord::Migration
  def change
    add_column :itunes, :client_id, :integer

  end
end
