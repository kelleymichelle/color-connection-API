class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :color
      t.string :bio
      t.string :birthday
      t.string :location
      t.string :gender
      t.string :zodiac
      t.string :image
      t.string :status


      t.timestamps
    end
  end
end
