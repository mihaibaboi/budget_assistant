class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :user, null: false
      t.string :name, null: false, limit: 40
      t.string :description

      t.timestamps null: false
    end
    
    add_foreign_key :accounts, :users
  end
end
