class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :twitter]

  has_many :jobs
  has_many :bids, :foreign_key => 'applicant_id'

  belongs_to :provider

  validates :username, presence: true, uniqueness: true
  
  include Gravtastic
  gravtastic size: 120, default: "identicon"

  def image
    if self.avatar.nil?
      return self.gravatar_url
    else
      self.avatar
    end
  end

  def poster_jobs
    Job.where(poster: self)
  end

  def helper_jobs
    Job.where(helper: self)
  end

  def admin?
    self.role == 'admin'
  end

  def registered_user (user)
    #lookup in provider table
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email # || "#{Devise.friendly_token[0,10]}@fakemail.com"
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first
    unless user
        user = User.create(name: data["name"],
           email: data["email"],
           password: Devise.friendly_token[0,20]
        )
    end
    user
  end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.uid + "@twitter.com").first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.uid+"@twitter.com",
                           password:Devise.friendly_token[0,20],
               )
      end
    end
  end
  
end
