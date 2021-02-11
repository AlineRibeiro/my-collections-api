# frozen_string_literal: true

class RenameCollectionsToCompanies < ActiveRecord::Migration[6.1]
  def change
    rename_table :collections, :companies
  end
end
