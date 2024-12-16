module Owner
  class PropertiesController < ApplicationController
    before_action :authenticate_user!
    def index
      @properties = Property.all
    end
  end
end
