class Custom < ActiveRecord::Base
   acts_as_heir_of :ticket
end
