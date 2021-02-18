class CreateCompanyHashtags < ActiveRecord::Migration[6.1]
  def change
    create_table :company_hashtags do |t|
      t.references :company, null: false, foreign_key: true
      t.references :hashtag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
