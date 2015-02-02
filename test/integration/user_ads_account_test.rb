require 'test_helper'

class UserAdsAccountTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user)
  end
  
  test 'login and add account' do
    get '/users/sign_in'
    assert_response :success
    
    post_via_redirect '/users/sign_in', user: { email: @user.email, password: attributes_for(:user)[:password] }
    assert_response :success
    
    get '/accounts/new'
    post_via_redirect '/accounts', account: { name: 'Account via integration', description: 'This account was created via the :login_and_add_account integration test' }
    assert_response :success
    assert_not_nil assigns(:account)
  end
  
  teardown do
    @user = nil
  end
end
