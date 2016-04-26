class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :name
      t.date :begin_date 
      t.date :deadline
      t.belongs_to :profile
      t.timestamps null: false
    end
  end
end
