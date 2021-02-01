class RenameSnacksToCollections < ActiveRecord::Migration[6.1]
  def change
    rename_table :snacks, :collections
  end
end
