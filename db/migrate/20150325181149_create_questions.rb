class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.text :ans1
      t.text :ans2
      t.text :ans3
      t.integer :correctAnswer
      t.references :quiz, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
