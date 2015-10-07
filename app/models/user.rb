class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :linked_in, :google_oauth2]
         
          
         
  has_one :profile, :dependent => :destroy
  accepts_nested_attributes_for :profile
         
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      user.provider = auth.provider
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.build_profile{}
      user.profile.name = auth.info.name   # assuming the user model has a name
      user.profile.remote_profile_pic = auth.info.image# assuming the user model has an image
      user.skip_confirmation! 
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end
         
        def send_devise_notification(notification, *args)
          devise_mailer.send(notification, self, *args).deliver_later
        end
end
