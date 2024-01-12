# frozen_string_literal: true
class Picture < ActiveRecord::Base
  belongs_to :project

  default_scope { order(position: :asc) }

  # has_attached_file :image, styles: {
  has_one_attached :image

  # before_post_process { |_c| transliterate_file_name(:image) }

  # validates_attachment_content_type :image,
  #                                   content_type: %r{^image\/(png|gif|jpeg)},
  #                                   message: :only_jpg_png_gif_format

  # validates_attachment_size :image,
  #                           less_than: 3.megabytes,
  #                           message: :only_less_than_3_mb
end
