class Picture < ActiveRecord::Base
  belongs_to :project

  has_attached_file :image, styles: {
    mini: "70x70#",
    thumb: "100x100#",
    medium: "200x200#",
    large: "400x400#"
  }

  before_post_process { |c| transliterate_file_name(:image) }

  validates_attachment_content_type :image,
                                    content_type: /^image\/(png|gif|jpeg)/,
                                    message: :only_jpg_png_gif_format

  validates_attachment_size :image,
                            less_than: 3.megabytes,
                            message: :only_less_than_3_mb
end
