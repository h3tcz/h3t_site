# frozen_string_literal: true
module AdminHelper
  def li_navbar_link(text, url = nil, _options = {}, &block)
    actual_url = text && url.nil? ? text : url
    actual_url = url_for(actual_url) if actual_url.is_a?(Hash)
    html_class = 'active' if request.fullpath =~ /^#{Regexp.escape(actual_url)}$/
    link = link_to text, url, {}, &block
    content_tag :li, link, class: html_class
  end
end
