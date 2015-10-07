module ApplicationHelper
    def user_profile
        current_user.profile
    end
    
    def display_pic(profile)

        if profile.user.provider.nil?
           profile.profile_pic.url
            
        elsif profile.profile_pic.blank?
            profile.remote_profile_pic
        else
             profile.profile_pic.url
        end
           
    end
end
