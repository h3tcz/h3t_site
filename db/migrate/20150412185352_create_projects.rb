class CreateProjects < ActiveRecord::Migration[4.2]
  def change
    create_table :projects do |t|
      t.string :slug_cz
      t.string :slug_en
      t.string :title_cz
      t.string :title_en
      t.integer :year
      t.string :location_cz
      t.string :location_en
      t.string :collaborator_cz
      t.string :collaborator_en
      t.text :content_cz
      t.text :content_en
      t.boolean :published, default: false

      t.timestamps null: false
    end
  end
end
