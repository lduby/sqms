class Step < ActiveRecord::Base
  belongs_to :test
  has_many :runs
end
