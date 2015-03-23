class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name
      t.references :Subject, index: true

      t.timestamps
    end
  end
end
