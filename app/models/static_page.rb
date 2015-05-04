class StaticPage < ActiveRecord::Base
  include Sluggable

  scope :published, -> { where(published: true) }
end
