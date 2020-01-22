class FavoriteArtistsController < ApplicationController
  def create
    current_user.favorite_artist(@artist)
    render 'artists/show'
  end

  def destroy
    current_user.unfavorite_artist(@artist)
    render 'artists/show'
  end

  private

  def find_favorite
    @favorite = FavoriteArtist.find(:params[:artist])
  end
end
