class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.references :user, null: true
      t.string :name, null: false, limit: 40

      t.timestamps null: false
    end
    
    add_foreign_key :categories, :users
  end
end
