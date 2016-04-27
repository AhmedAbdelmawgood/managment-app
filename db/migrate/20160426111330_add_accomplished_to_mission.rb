class AddAccomplishedToMission < ActiveRecord::Migration
  def change
    add_column :missions, :accomplished, :boolean, default: false
    add_column :missions, :priority, :integer 
  end
end
