# frozen_string_literal: true
class StaticPage < ActiveRecord::Base
  include Sluggable

  default_scope { order(position: :asc) }
  scope :published, -> { where(published: true) }
end
