module Sluggable
  extend ActiveSupport::Concern

  included do
    before_save :set_slugs

    def slug_string
      "CZ: /#{slug_cz} EN: /#{slug_en}"
    end

    def title
      "#{title_cz} (#{title_en})"
    end

    def published_word
      published ? "Yes" : "No"
    end

    private

    def set_slugs
      self.slug_cz = title_cz.parameterize if title_cz_changed?
      self.slug_en = title_en.parameterize if title_en_changed?
    end

  end

  # TODO needs something like #slug to decide according to chosen language which one to use
  # find usage then in projects_controller
  # find usage then in static_pages_controller
end
