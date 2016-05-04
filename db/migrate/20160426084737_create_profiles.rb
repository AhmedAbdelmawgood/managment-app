class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.belongs_to :user
      t.text :user_image  	
      t.timestamps null: false
    end
  end
  def self.down 
  	drop_table :profiles
  end
end
