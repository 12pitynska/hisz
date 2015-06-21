class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_surveys

  before_save :assign_role

  validates :login, presence: true, length: { minimum: 5 }, uniqueness: true 
  validates :email, presence: true, uniqueness: true 
  
  has_many :articles
  has_many :theories
  has_many :news
  has_many :vocabularies
def assign_role
  self.role = Role.find_by name: "User" if self.role.nil?
end


end
