class ProfilesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile, only: [:edit, :update]


    def update
         if @profile.update(profile_params)
            redirect_to edit_profile_path, notice: 'profile saved'
         else
            redirect_back fallback_location: edit_profile_path, alert: 'unable to update the profile'
         end
    end


    private
    def set_profile
     @profile = current_user.profile
    end

    def profile_params
        params.require(:profile).permit(
            :name,
            :address_1,
            :address_2,
            :city,
            :state,
            :country_code,
            :picture
        )
    end
end