# frozen_string_literal: true

class Snack < ApplicationRecord
  belongs_to :user

  validates :name, :description, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :description, length: { minimum: 20 }
end
