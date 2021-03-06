RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end


require 'rspec'
require 'httparty'
require 'selenium-webdriver'
require 'yaml'
require 'json'
require 'pry'

def url(path = '')
  ('http://localhost:3001' + path)
end
