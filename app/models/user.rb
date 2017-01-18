class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # TODO: set up recoverable. I don't think I'll get as far as setting up email stuff
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :username, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :posts
end
