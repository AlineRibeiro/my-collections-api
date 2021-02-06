# frozen_string_literal: true

class Collection < ApplicationRecord
  belongs_to :user
  has_many :collection_items

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :description, length: { minimum: 20 }
end
