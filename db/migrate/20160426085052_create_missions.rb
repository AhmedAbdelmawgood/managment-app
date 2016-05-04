class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :name
      t.date :begin_date 
      t.date :end_date 
      t.text :description
      t.belongs_to :profile
      t.boolean :accomplished, default: false
      t.integer :priority
      t.timestamps null: false
    end
  end
end
