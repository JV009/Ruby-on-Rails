class AddActiveToTests < ActiveRecord::Migration[7.1]
  def change
    add_column :tests, :active, :boolean, default: false
  end
end
