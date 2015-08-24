class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author, null: false
      t.text :body, null: false
      t.integer :article_id, null: false
      t.timestamps null: false
    end

    add_index :comments, :article_id
  end
end
