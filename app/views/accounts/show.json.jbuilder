json.extract! @account, :id, :user_id, :name, :description, :created_at, :updated_at
json.email @account.user.email
