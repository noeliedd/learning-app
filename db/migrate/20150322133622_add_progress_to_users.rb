class AddProgressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :level, :int,  null: false, default: 1
  end
end
