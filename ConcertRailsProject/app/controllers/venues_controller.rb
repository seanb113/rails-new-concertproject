class VenuesController < ApplicationController
  before_action :find_venue, only: [:show, :edit, :destroy]
  def index
    @venues = Venue.all
  end
  
  def show
  end

  def edit
  end

  def new
  end

  def create
  end

  private

  def find_venue
    @venue = Venue.find(params[:id])
  end
  
end
