class FavoriteArtistsController < ApplicationController
  before_action :find_favorite, :require_login

  def new
    @favorite_artist = FavoriteArtist.new
  end

  def create
    if FavoriteArtist.create(artist: @artist, user: current_user).errors.messages.empty?
      redirect_to @artist, notice: 'Added to your favorites'
    else
      redirect_to @artist, notice: 'Already added to your favorites'
    end
  end

  def destroy
    # FavoriteArtist.where(artist_id: @artist.id, user_id: current_user.id).destroy
    # redirect_to @artist, notice: 'Artist removed from favorites'
    if current_user.unfavorite_artist(@artist)
      flash.now.notice = 'Deleted from favorites'
      render 'artists/show'
    else
      flash.now.notice = "This artist isn't in your favorites"
      render 'artists/show'
    end
  end

  private

  def favorite_artist_params
    params.require(:favorite_artist).permit(:user_id, artist_id)
  end

  def find_favorite
    @artist = Artist.find(params[:artist_id] || params[:id])
  end

  def require_login
    redirect_to controller: 'sessions', action: 'new' unless current_user
    flash.now.notice = "You must be logged in to add favorites"
  end

end
