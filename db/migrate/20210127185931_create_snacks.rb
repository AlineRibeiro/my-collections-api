# frozen_string_literal: true

class CreateSnacks < ActiveRecord::Migration[6.1]
  def change
    create_table :snacks do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
