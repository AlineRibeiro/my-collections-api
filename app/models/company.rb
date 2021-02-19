# frozen_string_literal: true

class Company < ApplicationRecord
  belongs_to :user
  has_many :company_hashtags
  has_many :hashtags, through: :company_hashtags

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :description, length: { minimum: 20 }
end
