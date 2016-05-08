class CreateContactItems < ActiveRecord::Migration
  def change
    create_table :contact_items do |t|
      t.belongs_to :contact
      t.string :user_name 
      t.text :user_image
      t.text :user_email
      t.timestamps null: false
    end
  end
end
