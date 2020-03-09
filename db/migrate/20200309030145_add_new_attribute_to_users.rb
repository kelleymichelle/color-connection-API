class AddNewAttributeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :animal, :string
  end
end
