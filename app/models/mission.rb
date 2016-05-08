class Mission < ActiveRecord::Base
	attr_accessor :admin
	scope :accomplished, -> (state) {where accomplished:state}
	before_save :add_users
	belongs_to :profile
	has_many :tasks
	has_and_belongs_to_many :users, through: :missions_users
	# has_and_belongs_to_many :users
	## validation
	validates :profile, presence: true
	validates :name, :begin_date, :end_date,:priority, presence: true
	validate :the_begin_date_is_before_end_date
	def the_begin_date_is_before_end_date
		if begin_date && end_date && begin_date > end_date #validate date "has a bug if the user enter one date only"
			errors.add(begin_date: 'Beginning date cannot be after deadline')
		end
	end
	def admin
		@admin = Profile.find(profile_id).user
	end
	def unify
		users = self.users.uniq
		self.users = []
		users.each {|x| self.users << x}
	end
	def add_users
		self.users << (self.profile.user)
	end
end
