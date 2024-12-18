module Owner
  class PropertiesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_property, only: [ :edit, :update, :update_amenities, :add_image,:remove_image ]
    def index
      @properties = current_user.properties
    end

    def update
      if @property.update!(property_params)
        redirect_to owner_property_path, notice: "Property updated successfully"
      else
        redirect_back fallback_location: owner_property_path, alert: "Unable to update the property"
      end
    end

    def update_amenities
      if @property.update!(amenities_params)
        redirect_to update_amenities_owner_property_path, notice: "Amenity updated successfully"
      else
        redirect_back fallback_location: update_amenities_owner_property_path, alert: "Unable to update the Amenity"
      end
    end

    def add_image
      if params[:property][:images].present?
        @property.images.attach(params[:property][:images])
        redirect_to edit_owner_property_path, notice: 'Images uploaded sucessfully'
      else
        redirect_back fallback_location: edit_owner_property_path, alert: 'Unable to upload the image'
      end
    end


    def remove_image
      image = @property.images.find(params[:image_id])
      if image.destroy!
        redirect_to update_amenities_owner_property_path, notice: "Image removed successfully"
      else
        redirect_back fallback_location: update_amenities_owner_property_path, alert: "Unable to delete the image"
      end
    end

    private
    def set_property
      @property = current_user.properties.find(params[:id])
    end

    def property_params
      params.require(:property).permit(
        :name,
        :address_1,
        :address_2,
        :city,
        :state,
        :country,
        :headline,
        :description
      )
    end

    def amenities_params
      params.require(:property).permit(amenity_ids: [])
    end
  end
end
