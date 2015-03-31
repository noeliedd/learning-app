class CreateQuizAttempts < ActiveRecord::Migration
  def change
    create_table :quiz_attempts do |t|
      t.references :user, index: true, foreign_key: true
      t.references :quiz, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.string :level
      t.boolean :passed, default: false
      t.float :mark

      t.timestamps null: false
    end
  end
end
