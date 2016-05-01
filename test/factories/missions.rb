FactoryGirl.define do
  factory :mission do
   factory :some_mission do 
   	 name 'Missions to control my self'
   	 begin_date '2016-01-02'
   	 deadline '2016-12-28'
   	 profile_id 1
   	 description 'Some text goes here'
   	 priority 5
   end 
  end
end
