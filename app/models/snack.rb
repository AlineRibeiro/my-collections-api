class Snack < ApplicationRecord
  belongs_to :user

  validates :name, :description, presence: true
  validates :name, uniqueness: true
  validates :description, length: { minimum: 20 }
end
