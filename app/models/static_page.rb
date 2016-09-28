# frozen_string_literal: true
class StaticPage < ActiveRecord::Base
  include Sluggable

  scope :published, -> { where(published: true) }
end
