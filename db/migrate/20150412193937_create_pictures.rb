class CreatePictures < ActiveRecord::Migration[4.2]
  def change
    create_table :pictures do |t|
      t.references :project, foreign_key: true

      t.timestamps null: false
    end
    add_index :pictures, :project_id
  end
end
