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
  ('http://localhost:3000' + path)
end

@cards = "[{\"_id\"=>\"57e90144e23cc0a63026a7c2\", \"Suit\"=>\"Spades\", \"Number\"=>3}, {\"_id\"=>\"57e90144e23cc0a63026a7c3\", \"Suit\"=>\"Spades\", \"Number\"=>4}, {\"_id\"=>\"57e90144e23cc0a63026a7c4\", \"Suit\"=>\"Spades\", \"Number\"=>5}, {\"_id\"=>\"57e90144e23cc0a63026a7c5\", \"Suit\"=>\"Spades\", \"Number\"=>6}, {\"_id\"=>\"57e90144e23cc0a63026a7c6\", \"Suit\"=>\"Spades\", \"Number\"=>7}, {\"_id\"=>\"57e90144e23cc0a63026a7c7\", \"Suit\"=>\"Spades\", \"Number\"=>8}, {\"_id\"=>\"57e90144e23cc0a63026a7c8\", \"Suit\"=>\"Spades\", \"Number\"=>9}, {\"_id\"=>\"57e90144e23cc0a63026a7c9\", \"Suit\"=>\"Spades\", \"Number\"=>10}, {\"_id\"=>\"57e90144e23cc0a63026a7ca\", \"Suit\"=>\"Spades\", \"Number\"=>11}, {\"_id\"=>\"57e90144e23cc0a63026a7cb\", \"Suit\"=>\"Spades\", \"Number\"=>12}, {\"_id\"=>\"57e90144e23cc0a63026a7cc\", \"Suit\"=>\"Spades\", \"Number\"=>13}, {\"_id\"=>\"57e90144e23cc0a63026a7cd\", \"Suit\"=>\"Spades\", \"Number\"=>14}, {\"_id\"=>\"57e90144e23cc0a63026a7ce\", \"Suit\"=>\"Hearts\", \"Number\"=>2}, {\"_id\"=>\"57e90144e23cc0a63026a7cf\", \"Suit\"=>\"Hearts\", \"Number\"=>3}, {\"_id\"=>\"57e90144e23cc0a63026a7d0\", \"Suit\"=>\"Hearts\", \"Number\"=>4}, {\"_id\"=>\"57e90144e23cc0a63026a7d1\", \"Suit\"=>\"Hearts\", \"Number\"=>5}, {\"_id\"=>\"57e90144e23cc0a63026a7d2\", \"Suit\"=>\"Hearts\", \"Number\"=>6}, {\"_id\"=>\"57e90144e23cc0a63026a7d3\", \"Suit\"=>\"Hearts\", \"Number\"=>7}, {\"_id\"=>\"57e90144e23cc0a63026a7d4\", \"Suit\"=>\"Hearts\", \"Number\"=>8}, {\"_id\"=>\"57e90144e23cc0a63026a7d5\", \"Suit\"=>\"Hearts\", \"Number\"=>9}, {\"_id\"=>\"57e90144e23cc0a63026a7d6\", \"Suit\"=>\"Hearts\", \"Number\"=>10}, {\"_id\"=>\"57e90144e23cc0a63026a7d7\", \"Suit\"=>\"Hearts\", \"Number\"=>11}, {\"_id\"=>\"57e90144e23cc0a63026a7d8\", \"Suit\"=>\"Hearts\", \"Number\"=>12}, {\"_id\"=>\"57e90144e23cc0a63026a7d9\", \"Suit\"=>\"Hearts\", \"Number\"=>13}, {\"_id\"=>\"57e90144e23cc0a63026a7da\", \"Suit\"=>\"Hearts\", \"Number\"=>14}, {\"_id\"=>\"57e90144e23cc0a63026a7db\", \"Suit\"=>\"Diamonds\", \"Number\"=>2}, {\"_id\"=>\"57e90144e23cc0a63026a7dc\", \"Suit\"=>\"Diamonds\", \"Number\"=>3}, {\"_id\"=>\"57e90144e23cc0a63026a7dd\", \"Suit\"=>\"Diamonds\", \"Number\"=>4}, {\"_id\"=>\"57e90144e23cc0a63026a7de\", \"Suit\"=>\"Diamonds\", \"Number\"=>5}, {\"_id\"=>\"57e90144e23cc0a63026a7df\", \"Suit\"=>\"Diamonds\", \"Number\"=>6}, {\"_id\"=>\"57e90144e23cc0a63026a7e0\", \"Suit\"=>\"Diamonds\", \"Number\"=>7}, {\"_id\"=>\"57e90144e23cc0a63026a7e1\", \"Suit\"=>\"Diamonds\", \"Number\"=>8}, {\"_id\"=>\"57e90144e23cc0a63026a7e2\", \"Suit\"=>\"Diamonds\", \"Number\"=>9}, {\"_id\"=>\"57e90144e23cc0a63026a7e3\", \"Suit\"=>\"Diamonds\", \"Number\"=>10}, {\"_id\"=>\"57e90144e23cc0a63026a7e4\", \"Suit\"=>\"Diamonds\", \"Number\"=>11}, {\"_id\"=>\"57e90144e23cc0a63026a7e5\", \"Suit\"=>\"Diamonds\", \"Number\"=>12}, {\"_id\"=>\"57e90144e23cc0a63026a7e6\", \"Suit\"=>\"Diamonds\", \"Number\"=>13}, {\"_id\"=>\"57e90144e23cc0a63026a7e7\", \"Suit\"=>\"Diamonds\", \"Number\"=>14}, {\"_id\"=>\"57e90144e23cc0a63026a7e8\", \"Suit\"=>\"Clubs\", \"Number\"=>2}, {\"_id\"=>\"57e90144e23cc0a63026a7e9\", \"Suit\"=>\"Clubs\", \"Number\"=>3}, {\"_id\"=>\"57e90144e23cc0a63026a7ea\", \"Suit\"=>\"Clubs\", \"Number\"=>4}, {\"_id\"=>\"57e90144e23cc0a63026a7eb\", \"Suit\"=>\"Clubs\", \"Number\"=>5}, {\"_id\"=>\"57e90144e23cc0a63026a7ec\", \"Suit\"=>\"Clubs\", \"Number\"=>6}, {\"_id\"=>\"57e90144e23cc0a63026a7ed\", \"Suit\"=>\"Clubs\", \"Number\"=>7}, {\"_id\"=>\"57e90144e23cc0a63026a7ee\", \"Suit\"=>\"Clubs\", \"Number\"=>8}, {\"_id\"=>\"57e90144e23cc0a63026a7ef\", \"Suit\"=>\"Clubs\", \"Number\"=>9}, {\"_id\"=>\"57e90144e23cc0a63026a7f0\", \"Suit\"=>\"Clubs\", \"Number\"=>10}, {\"_id\"=>\"57e90144e23cc0a63026a7f1\", \"Suit\"=>\"Clubs\", \"Number\"=>11}, {\"_id\"=>\"57e90144e23cc0a63026a7f2\", \"Suit\"=>\"Clubs\", \"Number\"=>12}, {\"_id\"=>\"57e90144e23cc0a63026a7f3\", \"Suit\"=>\"Clubs\", \"Number\"=>13}, {\"_id\"=>\"57e90144e23cc0a63026a7f4\", \"Suit\"=>\"Clubs\", \"Number\"=>14}, {\"_id\"=>\"57e90167e23cc0a63026a7f5\", \"Suit\"=>\"Spades\", \"Number\"=>2}]"
