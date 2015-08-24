class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|

      t.string :email, null: false, unique: true
      t.timestamps null: false
    end

    add_index :subscribers, :email
  end
end
