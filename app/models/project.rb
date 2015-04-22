class Project < ActiveRecord::Base
  include Sluggable

  has_many :pictures, dependent: :destroy
  has_many :taggings
  has_many :tags, through: :taggings

  accepts_nested_attributes_for :pictures
end
