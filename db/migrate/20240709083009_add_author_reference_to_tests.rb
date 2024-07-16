class AddAuthorReferenceToTests < ActiveRecord::Migration[7.1]
  def change
    add_reference :tests, :author, foreign_key: { to_table: :users }
  end
end
