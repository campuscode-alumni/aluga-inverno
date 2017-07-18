class PropertiesController < ApplicationController
  before_action :authenticate_owner!, only:[:new]
  before_action :set_collections, only: [:new, :edit]

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
      @property_types = PropertyType.all
      flash[:notice] = "Todos os campos devem ser preenchidos"
      render :new
    end
  end

  def edit
    @property = Property.find(params[:id])
  end

  def update
    @property = Property.find(params[:id])
    @property.update(property_params)
    redirect_to @property
  end

  def filter
    @properties = Property.where("property_location like  ?  ", "%#{params[:filter]}%")
  end

private
  def property_params
    params.require(:property).permit(:property_type_id, :maximum_guests,
    :minimum_rent, :maximum_rent, :rent_purpose, :property_location,
    :description, :rules, :daily_rate, :picture, :photo)
  end

  def set_collections
    @property_types = PropertyType.all
  end

end
