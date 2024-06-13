class CreateAnswers < ActiveRecord::Migration[7.1]
  def change
    create_table :answers do |t|
      t.text :body
      t.boolean :correct

      t.timestamps
    end
  end
end
