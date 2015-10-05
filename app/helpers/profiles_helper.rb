module ProfilesHelper
    def is_current_user(profile)
        current_user == profile.user
    end
end
