class StaticPage < ActiveRecord::Base
  before_save :set_slugs

  def slug
    "CZ: /#{slug_cz}
    EN: /#{slug_en}"
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
