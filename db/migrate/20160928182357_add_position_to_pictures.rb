class AddPositionToPictures < ActiveRecord::Migration[4.2]
  def change
    add_column :pictures, :position, :integer
  end
end
