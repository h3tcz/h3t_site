class CreatePicotures < ActiveRecord::Migration[6.1]
  def change
    create_table :picotures do |t|

      t.timestamps
    end
  end
end
