FactoryGirl.define do
  factory :category do
    association :user
    name 'Wasting Money'
  end

end
