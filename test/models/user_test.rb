require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should respond to active relations' do
    user = create(:user)
    
    assert_respond_to(user, :accounts)
  end
end
