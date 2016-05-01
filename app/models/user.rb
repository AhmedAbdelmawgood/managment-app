class User < ActiveRecord::Base
  attr_accessor :missions_collection
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save :create_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_and_belongs_to_many :missions
  ## validation
  validates :name,:age, presence: true
  validates :age, inclusion: {in:(14..80)} 
  def create_profile 
  	puts 'LOL', id
  	Profile.new(user_id: id).save
  end
  def missions_collection
  	result = self.profile.missions.all
  	result += self.missions.all
  end
end
