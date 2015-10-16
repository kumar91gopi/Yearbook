class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter,:linkedin, :google_oauth2]
         
         
  has_one :profile, :dependent => :destroy
  has_many :identities, :dependent => :destroy
  accepts_nested_attributes_for :profile
         
  def self.from_omniauth(auth, signed_in_resource = nil)
    identity = Identity.from_omniauth(auth)
    user = signed_in_resource ? signed_in_resource : identity.user
    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email = auth.info.email
      user = User.where(:email => email).first if email
      
      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        user.build_profile{}
        user.profile.name = auth.info.name   # assuming the user model has a name
        user.profile.remote_profile_pic = auth.info.image# assuming the user model has an image
        user.skip_confirmation!
        user.save!
      end
    end
    
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end
   
         
end
