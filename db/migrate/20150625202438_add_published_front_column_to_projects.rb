class AddPublishedFrontColumnToProjects < ActiveRecord::Migration[4.2]
  def change
    add_column :projects, :published_front, :boolean, default: true
  end
end
