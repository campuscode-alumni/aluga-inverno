class ReviewController < ApplicationController

  def new
    @property = Property.find(params[:property_id])
    @review = Review.new(property: @property)
  end
end
