class Hashtag < ApplicationRecord
  has_many :company_hashtags
  has_many :companies, through: :company_hashtags

  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :description, length: { minimum: 4 }
end
