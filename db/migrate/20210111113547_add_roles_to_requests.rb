class AddRolesToRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :requests, :superadmin_role, :boolean, :default => false
    add_column :requests, :user_role, :boolean, :default => true
  end
end
