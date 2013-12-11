class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |f|
      f.integer :user
      f.integer :friend
      f.boolean :accepted

      f.timestamps
    end
  end
end
