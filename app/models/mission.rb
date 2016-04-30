class Mission < ActiveRecord::Base
	attr_accessor :admin
	scope :accomplished, -> (state) {where accomplished:state}
	belongs_to :profile
	has_many :tasks
	# has_and_belongs_to_many :users
	validates :name, :begin_date, :deadline, :profile_id,:priority, presence: true
	validate :the_begin_date_is_before_end_date
	validates :profile_id, uniqueness: false
	def the_begin_date_is_before_end_date
		if begin_date > deadline
			errors.add(begin_date: 'Beginning date cannot be after deadline')
		end
	end
	def admin
		self.admin = Profile.find(profile_id).user
	end

end
