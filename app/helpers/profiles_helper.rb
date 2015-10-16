module ProfilesHelper
    def is_current_user(profile)
        current_user == profile.user
    end
    
    def has_signed(profile)
        @signer=current_user.profile
        @message=@signer.signatures.where(:yearbook_id => profile.id)
        if @message.exists?
            false
        else
            true
        end
    end
end
