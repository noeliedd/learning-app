class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :title
      t.integer :topic
      t.text :question
      t.text :ans1
      t.text :ans2
      t.text :ans3
      t.text :ans4
      t.integer :correctAns

      t.timestamps
    end
  end
end
