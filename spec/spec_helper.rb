require_relative '../lib/cb'
require_relative './helpers'

RSpec.configure do |config|
  config.mock_framework = :mocha
  config.include Helpers
end
