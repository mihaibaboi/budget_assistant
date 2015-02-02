require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should respond to active relations' do
    user = create(:user)
    
    assert_respond_to(user, :accounts)
  end
  
  test 'should respect dependent tables' do
    user = create(:user)
    create(:account, user_id: user.id)
    
    assert(user.destroy)
    assert_equal(0, Account.all.count)
  end
end
