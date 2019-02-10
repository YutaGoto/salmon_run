require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SalmonRun
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.i18n.default_locale = :ja
    config.assets.paths << Rails.root.join('vendor', 'assets', 'components')
    config.active_record.default_timezone = :local
    config.time_zone = 'Tokyo'
    config.assets.initialize_on_precompile = false
    config.generators.javascript_engine = :js

    config.weapon_index_analysis = config_for(:weapon_index_analysis)
  end
end
