class AddTestsTitleNullConstraint < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
  end
end
