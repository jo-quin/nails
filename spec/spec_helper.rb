# frozen_string_literal: true

require 'aruba/rspec'
require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each, type: :feature) do
    Thread.new{ system('ruby server.rb') }
    Capybara.current_driver = :selenium
    Capybara.app_host = 'http://localhost:8080'
    Capybara.server_host = 'localhost'
    Capybara.server_port = '8080'
  end

  config.after(:each, type: :feature) do
    system('server_id=$(ps | grep server.rb | grep ruby | cut -c1-5); kill ${server_id}')
  end
end

SimpleCov.formatter = SimpleCov::Formatter::Console

SimpleCov.start
