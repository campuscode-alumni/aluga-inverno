class PropertiesController < ApplicationController
  before_action :authenticate_owner!, only:[:new,:edit]
  def show
    @property = Property.find(params[:id])
  end

  def new
    @property = Property.new
    @purposes = Purpose.all
  end

  def create
    @property = Property.new(property_params)
    @purposes = Purpose.all
    @property.owner = current_owner
    if @property.save
      redirect_to @property
    else
      flash[:notice] = "Todos os campos devem ser preenchidos"
      render :new
    end
  end

  def edit
    @property = Property.find(params[:id])
    @purposes = Purpose.all
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
    params.require(:property).permit(:property_type, :maximum_guests,
    :minimum_rent, :maximum_rent, :property_location,
    :description, :rules, :daily_rate, :picture, :photo, purpose_ids: [])
  end

end
