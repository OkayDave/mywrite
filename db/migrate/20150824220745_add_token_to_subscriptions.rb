class AddTokenToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscribers, :token, :string 
    add_index :subscribers, :token
  end
end
