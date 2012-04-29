class Role < ActiveRecord::Base
  # HABTM relationship with users
  has_and_belongs_to_many :users, :join_table => :users_roles
  # HABTM relationship with permissions
  has_and_belongs_to_many :permissions
  belongs_to :resource, :polymorphic => true
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name
end
