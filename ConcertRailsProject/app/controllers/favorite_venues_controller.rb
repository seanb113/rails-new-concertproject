class FavoriteVenuesController < ApplicationController
  def create
    current_user.favorite_venue(@venue)
    render 'venues/show'
  end

  def destroy
    current_user.unfavorite_venue(@venue)
    render 'venues/show'
  end

  private
  def find_favorite
    @favorite = FavoriteVenue.find(:params[:venue])
  end
end
