class Campaign < ActiveRecord::Base
    acts_as_heir_of :ressource
    has_and_belongs_to_many :tests	
end
