FactoryGirl.define do
  factory :account do
    association :user
    name 'FactoryGirl Default'
    description 'Default account for FactoryGirl User'
  end

end
