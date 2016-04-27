class AddAttributesToMission < ActiveRecord::Migration
  def change
  add_column :missions, 		:description, :text
  add_index  :missions, :profile_id, unique: true
  end
end
