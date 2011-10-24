class Story < ActiveRecord::Base
   acts_as_heir_of :ticket
   validates :actor, :presence => true
   validates :goal, :presence => true,
                    :length => { :minimum => 5 }
   validates :benefit, :presence => true
   has_many :defects, :dependent => :destroy
end
