class PropertiesController < ApplicationController
  before_action :authenticate_owner!, only:[:new]
  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
  end

  def create
    @property = Property.new(property_params)
    @property.owner = current_owner
    if @property.save
      redirect_to @property
    else
      flash[:notice] = "Todos os campos devem ser preenchidos"
      render :new
    end
  end
  def filter
    @properties = Property.where("property_location like  ?  ", "%#{params[:filter]}%")
  end

private
  def property_params
    params.require(:property).permit(:property_type, :maximum_guests,
    :minimum_rent, :maximum_rent, :rent_purpose, :property_location,
    :description, :rules, :daily_rate, :picture)
  end

end
