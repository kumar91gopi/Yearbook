class RegistrationsController < Devise::RegistrationsController
   before_filter :update_sanitized_params
 
  def new 
     build_resource({})
     resource.build_profile
     respond_with self.resource
  end
 
  def create
    super
  end
  

 
  private
   
     
      
      def update_sanitized_params
        
        devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email,:password, :password_confirmation,:profile_attributes => [:id, :name, :profile_pic])}
                                              
        devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:email, :password, :password_confirmation,:current_password)}
         
         
      end
  
end
