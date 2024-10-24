class CreateTests < ActiveRecord::Migration[7.1]
  def change
    create_table :tests do |t|
      t.string :title, null: false
      t.integer :level, null: false, default: 0
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
