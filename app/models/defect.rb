class Defect < ActiveRecord::Base
   acts_as_heir_of :ticket
   belongs_to :story
end
