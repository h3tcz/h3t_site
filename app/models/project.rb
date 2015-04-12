class Project < ActiveRecord::Base
  include Sluggable

  has_many :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures
end
