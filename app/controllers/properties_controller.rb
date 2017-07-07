class PropertiesController < ApplicationController

  def show
    @property = Property.find(params[:id])
  end

  def filter
    @properties = Property.where(property_location: params[:filter])
  end

end
