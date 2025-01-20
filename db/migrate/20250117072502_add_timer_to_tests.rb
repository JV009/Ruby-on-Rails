class AddTimerToTests < ActiveRecord::Migration[7.1]
  def change
    add_column :tests, :timer, :integer
  end
end
