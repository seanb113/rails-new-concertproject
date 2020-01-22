class FavoriteArtistsController < ApplicationController
  before_action :find_favorite

  def create
    if current_user.favorite_artist(@artist)
      flash.notice = 'Added to favorites'
      render 'artists/show'
    else
      flash.notice = 'Already added to favorites'
      render 'artists/show'
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
