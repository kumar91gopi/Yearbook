class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_cache_buster
  
  
  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
  
  def after_sign_in_path_for(resource)
    if current_user.profile.school_id.nil?
      edit_profile_path(current_user.profile)
    else
      profile_path(current_user.profile)
    end     
  end
  
  def after_sign_up_path_for(resource)
    edit_profile_path(current_user.profile)
  end
  
  
end
