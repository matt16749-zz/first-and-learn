class User < ActiveRecord::Base
  has_many :comments
  has_many :paths
  has_many :assets
  has_many :votes

  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, => :omniauth_providers => [:facebook]
end
