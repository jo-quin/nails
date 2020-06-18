# frozen_string_literal: true

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

require 'aruba/rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::Console

SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[31mAre you running rubocop? Just run: rubocop\e[0m"
    puts "\e[31mAlso remember to commit when passing a new test!\e[0m"
  end
end
