class ContentToText < ActiveRecord::Migration
  def change
      remove_column :microposts, :content
      add_column :microposts, :content, :text
  end
end
