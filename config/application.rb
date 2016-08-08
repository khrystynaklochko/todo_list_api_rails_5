require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TodoApiRails5
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # Api adapter
    ActiveModel::Serializer.config.adapter = :json_api
    
    # Rails 5 config
    Rails.application.config.active_record.belongs_to_required_by_default = true
    
    # Halt for callback
    ActiveSupport.halt_callback_chains_on_return_false = false
    
    # Password filter
    Rails.application.config.filter_parameters += [:password]
    
    # Use mimtype
    Mime::Type.register "application/vnd.api+json", :json
    
    # SSL for subdomains
    Rails.application.config.ssl_options = { hsts: { subdomains: true } }
    
    # Preservs time zone
    ActiveSupport.to_time_preserves_timezone = true

    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :put, :patch, :delete, :post, :options]
      end
    end


  end
end
