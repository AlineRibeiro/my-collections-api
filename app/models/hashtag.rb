class Hashtag < ApplicationRecord

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :description, length: { minimum: 4 }
end
