class ReviewsController < ApplicationController
  before_action :set_review, only: [:show]

  def index
    @fivestarbeers = Review.five_stars
    @following = current_user.following.pluck(:id)
    @reviews = Review.all.select do |r|
      @following.include?(r.user_id)
    end
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = params[:user_id]
    @review.save

    if @review.errors.any?
      render :new
    else
      redirect_to @review
    end
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:user_id,:beer_id, :content, :rating)
  end
end
