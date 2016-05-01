class CreateMissionsUsers < ActiveRecord::Migration
  def change
    create_table :missions_users do |t|
    	t.belongs_to :mission 
    	t.belongs_to :user
    end
  end
  def self.down 
  	drop_table :missions_users
  end
end
