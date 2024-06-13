class AddAnswerNullCanstraint < ActiveRecord::Migration[7.1]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :correct, false)
  end
end
