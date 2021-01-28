# frozen_string_literal: true

class AddSnacksRefToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :snacks, :user, null: false, foreign_key: true
  end
end
