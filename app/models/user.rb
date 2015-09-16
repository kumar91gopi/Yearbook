class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
         
          
         
  has_one :profile
  accepts_nested_attributes_for :profile
         
         
         
        def send_devise_notification(notification, *args)
          devise_mailer.send(notification, self, *args).deliver_later
        end
end
