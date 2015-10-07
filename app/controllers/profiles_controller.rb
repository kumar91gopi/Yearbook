class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy, :yearbook]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:new ,:destroy]
  before_action :prepare_schools
 
  # GET /profiles
  # GET /profiles.json
  def index
  
    if params[:search]
      @profiles = Profile.where(school_id: current_user.profile.school_id).search(params[:search]).order("name")
    else
      @profiles = Profile.where(school_id: current_user.profile.school_id).order('name')
    end
    
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
  end

  # GET /profiles/new
  def new
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    unless @profile.educations.blank?
      @profile.educations.each do |education|
        education ||= education_build
      end
    else
      @profile.educations.build
    end
    
    unless @profile.occupations.blank?
      @profile.occupations.each do |occupation|
        occupation ||= occupation_build
      end
    else
      @profile.occupations.build
    end
     
  end
  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def yearbook
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :name, :date_of_birth, :city, :about_me, :user_type, :school_id,:gender, :profile_pic,:remove_profile_pic,
                                      :educations_attributes =>[:id,:institute,:field,:from,:to, :_destroy],
                                      :occupations_attributes =>[:id,:company,:position,:city,:from,:to, :_destroy])
    end
    
    def prepare_schools
      @schools = School.all
    end
    
    def admin_user
       unless current_user.is_admin?
        redirect_to current_user.profile
       end
    end
    
    def correct_user
       unless (current_user.profile==@profile)
        redirect_to current_user.profile
       end
    end
    
end
