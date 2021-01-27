class Snack < ApplicationRecord
  belongs_to :user

  validate :name, :description, presence: true
  validates :description, length: { minimum: 20 }
end
