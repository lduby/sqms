class Role < ActiveRecord::Base
  # HABTM relationship with users
  has_and_belongs_to_many :users
  
  # HABTM relationship with permissions
  has_and_belongs_to_many :permissions
end
