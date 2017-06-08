# frozen_string_literal: true

module Admin
  class PicturesController < AdminController
    def sort
      params[:pictures].each_with_index do |id, index|
        Picture.find(id).update(position: index + 1)
      end
      render nothing: true
    end
  end
end
