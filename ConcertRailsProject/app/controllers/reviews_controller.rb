class ReviewsController < ApplicationController
  def index
  end
  
  def new
    @review = Review.new
  end

  def show
  end

  def create
    #byebug
      @review = Review.create(concert_id: params[:concert_id], user_id: current_user.id)
    if @review.save
      @review.update(review_params)
      redirect_to concert_path(@review.concert_id)
    else
      flash.notice = "You already reviewed this concert."
      redirect_to concert_path(@review.concert_id)
    end
  end

  def delete
  end


  private

  def review_params
    params.require(:review).permit(:title, :content, :concert_id, :rating)
  end
end
