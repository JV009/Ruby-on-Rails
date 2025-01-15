class AddSuccessfulToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :successful, :boolean, null: false, default: false
  end
end
