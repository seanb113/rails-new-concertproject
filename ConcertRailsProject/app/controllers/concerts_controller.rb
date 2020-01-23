class ConcertsController < ApplicationController
  before_action :find_concert, only: [:show, :edit, :destroy]
  
  def index
    @upcoming_concerts = Concert.all.select {|c| !c.date.past?}
    #byebug
    if params[:sort] == "location"
    @concerts = @upcoming_concerts.sort_by{|c| c.location}
    else
    @concerts = @upcoming_concerts.sort_by{|c| c[params[:sort]]}
    end
  end
  
  def show
    @review = Review.new
  end

  def edit
  end

  def new
    @concert = Concert.new
  end

  def create
  end

  def delete
  end

  private 

  def find_concert
    @concert = Concert.find(params[:id])
  end

  def concert_params
    params.require(:concert).permit(
      :name, :venue_id, :date,
      reviews_attributes: [ :title, :content ]
    )
  end
end
