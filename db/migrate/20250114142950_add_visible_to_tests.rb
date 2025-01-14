class AddVisibleToTests < ActiveRecord::Migration[7.1]
  def change
    add_column :tests, :visible, :boolean
  end
end
