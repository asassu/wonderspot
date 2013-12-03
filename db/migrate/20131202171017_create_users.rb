class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.int    :id
      t.string :name
      t.string :email
      t.string :description
      t.string :interests
      t.string :quotes

      t.timestamps
    end
  end
end
