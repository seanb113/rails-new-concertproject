class FavoriteVenuesController < ApplicationController
  before_action :find_favorite

  def create
    if current_user.favorite_venue(@venue)
      redirect_to :back
    end
  end

  def destroy
    current_user.unfavorite_venue(@venue)
    if unfavorite_venue.destroy
      redirect_to :back, flash[:notice] = 'Removed from favorites'
    else
      redirect_to :back, flash[:alert] = 'Not saved as a favorite'
    end
  end

  private

  def find_favorite
    @venue = Venue.find(params[:venue_id])
  end
end
