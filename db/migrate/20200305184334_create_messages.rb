class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :reciever_id
      t.text :content
      t.boolean :viewed

      t.timestamps
    end
  end
end
