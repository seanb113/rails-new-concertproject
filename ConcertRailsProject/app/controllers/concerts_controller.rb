class ConcertsController < ApplicationController
  before_action :find_concert, only: [:show, :edit, :destroy]
  
  def show
    @review = Review.new
  end

  def index
    #@upcoming_concerts = Concert.all.select {|c| !c.date.past?}
    #byebug
    if params[:sort] == "location"
      @concerts = Concert.search(params[:search]).sort_by{|c| c.location}
    elsif params[:sort] == "name"
      @concerts = Concert.search(params[:search]).sort_by{|c| c.sortable_name}
    elsif params[:sort] == "artist"
      @concerts = Concert.search(params[:search]).sort_by{|c| c.headliner.artist.sortable_name}
    elsif params[:sort] == "venue"
      @concerts = Concert.search(params[:search]).sort_by{|c| c.venue.sortable_name}
    elsif params[:sort] == "date"
      @concerts = Concert.search(params[:search]).sort_by{|c| c.date}
    else
      @concerts = Concert.search(params[:search]).sort_by{|c| c[params[:search]]}
    end
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
