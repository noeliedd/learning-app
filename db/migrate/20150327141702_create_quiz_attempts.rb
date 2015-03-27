class CreateQuizAttempts < ActiveRecord::Migration
  def change
    create_table :quiz_attempts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :quiz, index: true, foreign_key: true
      t.decimal :mark

      t.timestamps null: false
    end
  end
end
