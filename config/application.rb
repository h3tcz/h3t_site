# frozen_string_literal: true

require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

Dotenv::Railtie.load if Rails.env.development?

module H3tSite
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
  end
end
