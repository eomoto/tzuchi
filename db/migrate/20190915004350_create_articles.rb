class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.text :body
      t.string :author
      t.integer :tags
      t.integer :status
      t.datetime :published_at
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :articles, :tags
    add_index :articles, :status
  end
end
