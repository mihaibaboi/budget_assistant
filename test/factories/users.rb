FactoryGirl.define do
  time = Time.now.to_i
  
  factory :user do
    email "factory_girl_#{time}@budget-assistant.com"
    password 'testpass21'
    confirmed_at '2015-01-21'
  end

end
