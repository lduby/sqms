class Iteration < ActiveRecord::Base
    acts_as_heir_of :ressource
    belongs_to :release	
    has_many :tickets
end
