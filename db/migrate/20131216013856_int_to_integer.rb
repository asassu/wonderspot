class IntToInteger < ActiveRecord::Migration
  def change
	change_table :users do |t|
	    t.change :id, :integer
	end
  end
end
