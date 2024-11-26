require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestGuru
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w(assets tasks))

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.time_zone = "Europe/Moscow"
    #config.i18n.default_locale = :ru
    # config.eager_load_paths << Rails.root.join("extras")
    # Where the I18n library should search for translations files
    I18n.load_path += Dir[Rails.root.join('lib', 'locale', '*.{rb,yml}')]
    # Permitted locales available for the application
    I18n.config.available_locales = [:en, :ru]
    # Set default locale to something other than :en
    I18n.default_locale = :ru

    config.autoload_paths << "#{Rails.root}/lib/clients"
  end
end
