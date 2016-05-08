class User < ActiveRecord::Base
  attr_accessor :missions_collection
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save :create_contact, :create_profile 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_one :contact
  has_many :contact_items, through: :contact
  has_and_belongs_to_many :missions
  has_many :tasks, through: :missions
  ## validation
  validates :name,:age, presence: true
  validates :age, inclusion: {in:(14..80)} 
  def create_profile 
  	Profile.new(user_id: self.id).save
  end

  def create_contact
    Contact.new(user_id: self.id).save
  end
  def missions_collection
  	result = self.profile.missions.all
  	result += self.missions.all
  end
end
 