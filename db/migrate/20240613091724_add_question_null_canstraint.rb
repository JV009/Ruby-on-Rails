class AddQuestionNullCanstraint < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:questions, :body, false)
  end
end
