require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Mgbook
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.i18n.default_locale = :de

    ActionMailer::Base.smtp_settings = {
        :address              => 'smtp.gmail.com',
        :domain               => 'mail.google.com',
        :port                 => 587,
        :user_name            => "10mgbook10@gmail.com",
        :password             => "ADm1234567",
        :authentication       => 'login',
        :enable_starttls_auto => true
    }

    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
