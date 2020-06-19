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
    Capybara.current_driver = :selenium_headless
    Capybara.app_host = 'http://localhost:8080'
    Capybara.server_host = 'localhost'
    Capybara.server_port = '8080'
  end
end

SimpleCov.formatter = SimpleCov::Formatter::Console

SimpleCov.start
