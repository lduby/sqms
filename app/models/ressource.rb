class Ressource < ActiveRecord::Base
	acts_as_predecessor
	has_and_belongs_to_many :tags
	accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
    has_many :comments
end
