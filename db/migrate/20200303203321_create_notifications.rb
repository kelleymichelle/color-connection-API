class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.string :content
      t.boolean :viewed, default: false

      t.timestamps
    end
  end
end
