class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :filename
      t.string :content_type
      t.binary :file_contents
      t.references :topic, index: true, foreign_key: true
      t.integer :subject_id
      
      t.timestamps null: false
    end
  end
end
