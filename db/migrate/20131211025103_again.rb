class Again < ActiveRecord::Migration
  def change
    remove_column :users, :description
    remove_column :users, :interests
    remove_column :users, :quotes
    add_column :users, :description, :text
    add_column :users, :interests, :text
    add_column :users, :quotes, :text
  end
end
