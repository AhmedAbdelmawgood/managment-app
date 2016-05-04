class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :mission, index: true
      t.belongs_to :user, index: true
      t.string  :title
      t.boolean :accomplished, null: false, default: false
      t.text 	:description
      t.integer :priority
      t.timestamps null: false
    end
  end
end
