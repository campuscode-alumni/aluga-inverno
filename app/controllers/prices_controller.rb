class PricesController < ApplicationController
  def new
    @property = Property.find(params[:property_id])
    @price = Price.new(property: @property)
  end

  def create
    @property = Property.find(params[:property_id])
    @price = @property.prices.new(prices_params)
    if @price.save
      redirect_to @property
    end
  end



private
  def prices_params
    params.require(:price).permit(:name, :start_date, :end_date, :total_amount)
  end
end
