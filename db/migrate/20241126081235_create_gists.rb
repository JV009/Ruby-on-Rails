class CreateGists < ActiveRecord::Migration[7.1]
  def change
    create_table :gists do |t|
      t.references :question, null: false, foreign_key: true
      t.string :url
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
