require 'test_helper'

class MissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  # test 'Should not be valid' do 
  # 	mission = FactoryGirl.create(:some_mission)
  # 	assert_not mission.valid?
  # end
  def setup 
  	@mission = Mission.new(name:'Test mission', begin_date:'2014-02-05', end_date:'2015-03-05',
  			                  profile_id:1, description:'Text for test description',priority:5)
  end
  test "bast perfect case" do 
  	assert @mission.valid?
  end
  test "mission should have profile" do 
  	@mission.profile = nil 
  	assert_not @mission.valid?
  end
  test "mission should have name"
  test "beginning date before the end date"
  test "Should respond to admin"
  test "mission should have users"
  test "should accept adding users"
  test "no dublicate user stored"

end
