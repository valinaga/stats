class AddClientIdToAndroid < ActiveRecord::Migration
  def change
    add_column :androids, :client_id, :integer

  end
end
