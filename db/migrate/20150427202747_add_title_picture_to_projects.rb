class AddTitlePictureToProjects < ActiveRecord::Migration
  def change
    add_attachment :projects, :title_picture
  end
end
