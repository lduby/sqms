class RolesHaveAndBelongToManyPermissions < ActiveRecord::Migration
  def self.up
    create_table :permissions_roles, :id => false do |t|
      t.references :permission, :role
    end
  end
 
  def self.down
    drop_table :permissions_roles
  end
end
