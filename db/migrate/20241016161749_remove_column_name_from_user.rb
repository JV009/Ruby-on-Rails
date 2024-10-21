class RemoveColumnNameFromUser < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :name, :string
  end
end
