class AddAttributesToMission < ActiveRecord::Migration
  def change
  add_column :missions, :description, :text
  end
end
