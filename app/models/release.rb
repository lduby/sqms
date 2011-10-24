class Release < ActiveRecord::Base
    acts_as_heir_of :ressource
    has_one :campaign	
    has_many :iterations
end
