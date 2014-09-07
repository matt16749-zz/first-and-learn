# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'factory_girl_rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include Warden::Test::Helpers

  config.include FactoryGirl::Syntax::Methods

  config.include Capybara::DSL

  config.include Devise::TestHelpers, :type => :controller


  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
end

Warden.test_mode!
