class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name, :string
    add_column :users, :introduction, :text
  end
end
