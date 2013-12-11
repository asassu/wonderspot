class Friendships < ActiveRecord::Migration
  def change
    create_table :friendships do |f|
      f.integer :user
      f.integer :friend
      f.boolean :accepted
    end
  end
end
