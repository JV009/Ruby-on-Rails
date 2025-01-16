class AddSuccesfulToTestPassages < ActiveRecord::Migration[7.1]
  def change
    add_column :test_passages, :successful, :boolean, null: false, default: false
  end
end
