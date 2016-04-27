class Mission < ActiveRecord::Base
	scope :accomplished, -> (state) {where accomplished:state}
	belongs_to :profile
	has_many :tasks
	validates :name, :begin_date, :deadline, :profile,:priority, presence: true
	validate :the_begin_date_is_before_end_date
	def the_begin_date_is_before_end_date
		if begin_date > deadline
			errors.add(begin_date: 'Beginning date cannot be after deadline')
		end
	end

end
