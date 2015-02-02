ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'factory_girl'

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
#   fixtures :all

  # Add more helper methods to be used by all tests here...
  def json_response
    ActiveSupport::JSON.decode @response.body
  end
  
  # Check weather a hash contains a list of specified keys
  # @param hash - the hash that we are checking
  # @param array_of_keys - an array of all the keys that we want the hash to include
  def includes_keys? (hash, array_of_keys)
    array_of_keys.all? {|s| hash.key? s}
  end
  
  def assert_resource_invalid(resource)
    assert_not(resource.valid?, "Resource #{resource.class} should not be valid")
  end
end
