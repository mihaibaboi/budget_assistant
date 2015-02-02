class Account < ActiveRecord::Base
  belongs_to :user
  
  validates :user_id, :name, presence: true
  validates :user_id, numericality: true
  validates :name, length: { maximum: 40 }
end
