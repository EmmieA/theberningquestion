class AddAdminToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean, default: false
    add_column :users, :bernie, :boolean, default: false
  end
end
