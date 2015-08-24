class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|

      t.string :author, null: false
      t.string :subject, null: false
      t.text   :body, null: false
      t.text   :renderer_html, null: :false
      t.timestamps null: false
    end
  end
end
