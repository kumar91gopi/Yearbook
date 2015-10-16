class SignaturesController < ApplicationController
    before_action :authenticate_user!
    before_action :prepare_profile
    before_action :correct_user, only: [:destroy]
     
    def create
        @signature = current_user.profile.signatures.build(signature_params)
        if @signature.save
          flash[:success] = "Thanx for signing the yearbook!"
          redirect_to yearbook_profile_path(@profile)
        else
          redirect_to request.referrer
        end
    end
    
    def destroy
        @signature.destroy
        flash[:success] = "Micropost deleted"
        redirect_to request.referrer || root_url
    end
    
     private
     
    def correct_user
        @signature = current_user.profile.signs.find_by(id: params[:id])
        redirect_to @profile if @signature.nil?
    end
    
    def prepare_profile
       @profile=Profile.find(session[:my_info])
    end


    def signature_params
      params.require(:signature).permit(:content,:image,:is_hidden).merge(yearbook_id: @profile.id)
    end
end
