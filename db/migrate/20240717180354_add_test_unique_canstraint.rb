class AddTestUniqueCanstraint < ActiveRecord::Migration[7.1]
  def change
    add_index :tests, [:title, :level], unique: true
  end
end
