class AddLoveLanguageToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :loveLanguage, :string
  end
end
