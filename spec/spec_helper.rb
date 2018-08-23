# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require 'rake'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

Rake.application.load_rakefile

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(
  [SimpleCov::Formatter::Console]
)

SimpleCov.start do
  add_filter 'helpers.rb'
end

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['clean_test_database'].execute
    Rake::Task['insert_genesis_block'].execute
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
