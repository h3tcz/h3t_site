class AddPositionToStaticPages < ActiveRecord::Migration[4.2]
  def change
    add_column :static_pages, :position, :integer
  end
end
