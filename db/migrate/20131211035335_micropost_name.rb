class MicropostName < ActiveRecord::Migration
  def change
    add_column :microposts, :username, :string
  end
end
