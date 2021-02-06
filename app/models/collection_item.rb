class CollectionItem < ApplicationRecord
  belongs_to :collection

  validates :name, presence: true
  enum condition: [:poor, :good, :brand_new]

end
