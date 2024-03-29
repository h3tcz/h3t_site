# frozen_string_literal: true
class Project < ActiveRecord::Base
  include Sluggable

  has_many :pictures, dependent: :destroy
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings

  default_scope { order("year DESC") }

  scope :with_year, ->(year) { where(year: year) }
  scope :published, -> { where(published: true) }
  scope :published_front_page, -> { where(published_front: true) }

  accepts_nested_attributes_for :pictures, allow_destroy: true

  validates :title_cz, :year, presence: true

  # has_attached_file :title_picture, styles: {
  has_one_attached :title_picture do |attachable|
    # Prepare for rails 7
    attachable.variant :mini, resize_to_limit: [70, 70]
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :medium, resize_to_limit: [200, 200]
    attachable.variant :large, resize_to_limit: [400, 400]
  end

  # before_post_process { |_c| transliterate_file_name(:image) }

  # validates_attachment_content_type :title_picture,
  #                                   content_type: %r{^image\/(png|gif|jpeg)},
  #                                   message: :only_jpg_png_gif_format

  # validates_attachment_size :title_picture,
  #                           less_than: 3.megabytes,
  #                           message: :only_less_than_3_mb
end
