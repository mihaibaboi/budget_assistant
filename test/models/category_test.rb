require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # Test validations
  
  test 'validates presence of fileds' do
    category = Category.new
    
    assert_resource_invalid category
    assert(includes_keys? category.errors.messages, [:name])
  end
  
  test 'validates numericality of fields' do
    category = build(:category, user_id: 'string')
    
    assert_resource_invalid category
    assert(includes_keys? category.errors.messages, [:user_id])
  end
  
  test 'validates lenght of field' do
    category = build(:category, name: 'This string is more than 40 characters long')
    
    assert_resource_invalid category
    assert(includes_keys? category.errors.messages, [:name])
  end
  
  # Test ActiveRelation
  
  test 'should respond to active relation' do
    category = create(:category)
    
    assert_respond_to(category, :user)
  end
  
  # Test CRUD operations
  
  test 'should create category' do
    category = Category.new(attributes_for(:category))
    category.user_id = create(:user).id
    assert(category.save, 'Category should have been created')
  end
  
  test 'should retrieve category list' do
    iterations = 10
    all = iterations + Category.all.count
    user = create(:user)
    10.times do
      create(:category, user_id: user.id)
    end
    
    assert_equal(all, Category.all.count, "Database should contain #{all} categories")
  end
  
  test 'should retreive a single category' do
    category = create(:category)
    
    assert_kind_of(Category, Category.find(category.id), 'Should have retreived an object of type :category')
  end
  
  test 'should update category' do
    user = create(:user, email: 'update-user@budget-assistant.com')
    category = create(:category)
    category_params = { user_id: user.id, name: 'Testing update from model' }
    updated_at = category.updated_at
    
    assert(category.update(category_params), 'Category should have been updated')
    assert_equal(category_params[:user_id], category.user_id, 'UserId should have been updated')
    assert_equal(category_params[:name], category.name, 'Name should have been updated')
    assert_not_equal(updated_at, category.updated_at, 'UpdatedAt should have been updated')
  end
  
  test 'should delete category' do
    category = create(:category)
    assert(category.destroy, 'Category should have been destroyed')
  end
end
