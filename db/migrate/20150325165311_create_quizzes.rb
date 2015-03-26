class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :name
      t.string :level
      t.references :topic, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
