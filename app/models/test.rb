class Test < ActiveRecord::Base
  belongs_to :ticket
  has_and_belongs_to_many :campaigns
  has_many :steps
end
