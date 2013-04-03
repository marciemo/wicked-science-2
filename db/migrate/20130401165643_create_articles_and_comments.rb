class CreateArticlesAndComments < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.column :title, :string
      t.column :author, :string
      t.column :link, :string

      t.timestamps
    end

    create_table :comments do |t|
      t.column :text, :string
      t.column :article_id, :int

      t.timestamps
    end
  end
end
