class Ticket < ActiveRecord::Base
    acts_as_heir_of :ressource
    belongs_to :iteration
    has_many :tests
	acts_as_predecessor
	
end
