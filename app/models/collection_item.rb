# frozen_string_literal: true

class CollectionItem < ApplicationRecord
  belongs_to :collection

  validates :name, presence: true
  enum condition: %i[poor good brand_new]
end
