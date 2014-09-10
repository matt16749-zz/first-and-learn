require File.expand_path('../boot', __FILE__)

require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require 'dotenv'
Dotenv.load

Bundler.require(*Rails.groups)

module FirstAndLearn
  class Application < Rails::Application
   
  end
end
