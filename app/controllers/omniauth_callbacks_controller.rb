class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_filter :authenticate_user!
	  
  def all
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    
    @user = User.from_omniauth(request.env["omniauth.auth"],current_user)

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "third party") if is_navigational_format?
    else
      session["devise.user_auth_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
    
  alias_method :facebook, :all
	alias_method :twitter, :all
	alias_method :linkedin, :all
	alias_method :google_oauth2, :all

end
