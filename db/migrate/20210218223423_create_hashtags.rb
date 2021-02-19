# frozen_string_literal: true

class CreateHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :hashtags do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
