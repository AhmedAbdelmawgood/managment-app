require 'test_helper'

class MissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test 'Should not be valid' do 
  	mission = FactoryGirl.create(:some_mission)
  	assert_not mission.valid?
  end

end
