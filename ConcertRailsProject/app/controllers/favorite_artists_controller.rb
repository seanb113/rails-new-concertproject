class FavoriteArtistsController < ApplicationController
  before_action :find_favorite

  def create
    if current_user.favorite_artist(@artist)
      render 'artists/show', flash.now[:notice] = 'Added to favorites'
    else
      redirect_to :back, flash.now[:alert] = 'Already added to favorites'
    end
  end

  def destroy
    if current_user.unfavorite_artist(@artist)
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private

  def find_favorite
    @artist = Artist.find(params[:artist_id])
  end
end
