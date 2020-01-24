class ReviewsController < ApplicationController
  def index
  end
  
  def new
    @review = Review.new
  end

  def show
  end

  def create
    @review = Review.new(review_params)
    @review.update(concert_id: params[:concert_id], user_id: current_user.id)
    #byebug
    if @review.valid?
      @review.save
      redirect_to concert_path(@review.concert_id)
    else
      redirect_to concert_path(@review.concert_id), notice: "You already reviewed this concert"
    end
  end

  def delete
  end


  private

  def review_params
    params.require(:review).permit(:title, :content, :concert_id, :user_id, :rating)
  end
end
