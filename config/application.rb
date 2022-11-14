# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AlumniTraq
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    #Rails.logger = Logger.new(STDOUT)
    #config.logger = ActiveSupport::Logger.new("log/#{Rails.env}.log")
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = 'Central Time (US & Canada)'
    config.active_record.default_timezone = :local
    # config.eager_load_paths << Rails.root.join("extras")

    # Configuration for spanish translation
    config.i18n.available_locales = [:en, :es]
    config.i18n.default_locale = :en
    config.i18n.fallbacks = true
  end
end
