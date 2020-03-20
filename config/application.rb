require_relative 'boot'

require 'rails/all'
require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ClassKeeper
  class Application < Rails::Application
    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework  :minitest, fixture: false
    end   
     # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    
    # ActionCable also allows you to whitelist the URL origin’s from which can connect 
    # via WebSockets to ActionCable. You’ll want to set this up when you go live with ActionCable 
    # in production to make sure that the WebSocket(ws:// by the way) are coming from the 
    # URL your application is using.
  
    # config.action_cable.mount_path = '/websocket'
    # config.action_cable.mount_path = 'redis://localhost:6379/1'

   

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
