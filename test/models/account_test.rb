require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # Test validations
  
  test 'validates presence of fileds' do
    account = Account.new
    
    assert_resource_invalid account
    assert(includes_keys? account.errors.messages, [:user_id, :name])
  end
  
  test 'validates numericality of fields' do
    account = build(:account, user_id: 'string')
    
    assert_resource_invalid account
    assert(includes_keys? account.errors.messages, [:user_id])
  end
  
  test 'validates lenght of field' do
    account = build(:account, name: 'This string is more than 40 characters long')
    
    assert_resource_invalid account
    assert(includes_keys? account.errors.messages, [:name])
  end
  
  # Test ActiveRelation
  
  test 'should respond to active relation' do
    account = create(:account)
    
    assert_respond_to(account, :user)
  end
  
  # Test CRUD operations
  
  test 'should create account' do
    account = Account.new(attributes_for(:account))
    account.user_id = create(:user).id
    assert(account.save, 'Account should have been created')
  end
  
  test 'should retrieve account list' do
    iterations = 10
    all = iterations + Account.all.count
    user = create(:user)
    10.times do
      create(:account, user_id: user.id)
    end
    
    assert_equal(all, Account.all.count, "Database should contain #{all} accounts")
  end
  
  test 'should retreive a single account' do
    account = create(:account)
    
    assert_kind_of(Account, Account.find(account.id), 'Should have retreived an object of type :account')
  end
  
  test 'should update account' do
    user = create(:user, email: 'update-user@budget-assistant.com')
    account = create(:account)
    account_params = { user_id: user.id, name: 'Testing update from model', description: 'Testing the description update from model' }
    updated_at = account.updated_at
    
    assert(account.update(account_params), 'Account should have been updated')
    assert_equal(account_params[:user_id], account.user_id, 'UserId should have been updated')
    assert_equal(account_params[:name], account.name, 'Name should have been updated')
    assert_equal(account_params[:description], account.description, 'Description should have been updated')
    assert_not_equal(updated_at, account.updated_at, 'UpdatedAt should have been updated')
  end
  
  test 'should delete account' do
    account = create(:account)
    assert(account.destroy, 'Account should have been destroyed')
  end
end
