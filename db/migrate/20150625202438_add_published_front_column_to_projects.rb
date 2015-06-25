class AddPublishedFrontColumnToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :published_front, :boolean, default: true
  end
end
