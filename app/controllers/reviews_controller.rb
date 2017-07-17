class ReviewsController < ApplicationController


  before_action :authenticate_user!, only: [:new, :create]

  def new
    @property = Property.find(params[:property_id])
    @review = Review.new(property: @property)
  end

  def create
    @property = Property.find(params[:property_id])
    @review = @property.reviews.build(review_params)
    @review.user = current_user
    @review.save
    redirect_to @property
  end

  private

  def review_params
    params.require(:review).permit(:rate,:comment)
  end

end
