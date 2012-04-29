class RolesHaveAndBelongToManyPermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions_roles, :id => false do |t|
      t.references :permission, :role
    end    
    
    add_index(:permissions_roles, [ :permission_id, :role_id ])
  end
 
  def self.down
    drop_table :permissions_roles
  end
end
