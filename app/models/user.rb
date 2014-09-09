class User < ActiveRecord::Base
  has_many :comments
  has_many :paths
  has_many :assets
  has_many :votes

  validates :email, :first_name, :last_name, presence: true
  validates :email, uniqueness: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:twitter]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      name = auth.info.name.split(" ")
      user.first_name = name[0]
      user.last_name = name[1] 
    end
  end

 def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise._data"] && session["devise._data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end  
end
