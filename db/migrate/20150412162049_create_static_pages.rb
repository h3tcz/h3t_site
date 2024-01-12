class CreateStaticPages < ActiveRecord::Migration[4.2]
  def change
    create_table :static_pages do |t|
      t.string :slug_cz
      t.string :title_cz
      t.text :content_cz
      t.string :slug_en
      t.string :title_en
      t.text :content_en
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
