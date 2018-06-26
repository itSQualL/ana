class CollectionNote < ApplicationRecord
  belongs_to :user
  has_many :notes

  accepts_nested_attributes_for :notes
end
