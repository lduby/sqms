class Story < ActiveRecord::Base

  # Setup accessible (or protected) attributes for your model
  attr_accessible :title, :actor, :goal, :benefit, :priority, :story_points
  
  # Form validations
  validates_presence_of :title, :actor, :goal
  
end
