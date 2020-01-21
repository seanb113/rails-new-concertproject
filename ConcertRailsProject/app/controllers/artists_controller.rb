class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :edit, :destroy]
  
  def index
    @artists = Artist.all
  end
  
  def show
  end

  def edit
  end

  def new
    @artist = Artist.new
  end


  def create
  end

  private

  def find_artist
    @artist = Artist.find(params[:id])
  end
end
