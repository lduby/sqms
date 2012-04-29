class Permission < ActiveRecord::Base
  # HABTM relationship with roles
  has_and_belongs_to_many :roles
  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :description, :action, :subject_class
end
