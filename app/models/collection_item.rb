class CollectionItem < ApplicationRecord
  belongs_to :collection

  validate :name, presence: true
  enum condition: [:poor, :good, :brand_new]

end
