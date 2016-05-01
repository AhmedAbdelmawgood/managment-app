class User < ActiveRecord::Base
  attr_accessor :missions_collection
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save :create_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_many :missions
  has_many :users
  ## validation
  validates :name,:age, presence: true
  validates :age, inclusion: {in:(14..80)} 
  def create_profile 
  	Profile.create(user_id: self.id)
  end
  def missions_collection
  	result = self.profile.missions.all
  	result += self.missions.all
  end
end
