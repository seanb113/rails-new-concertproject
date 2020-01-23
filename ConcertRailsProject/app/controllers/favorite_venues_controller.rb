class FavoriteVenuesController < ApplicationController
  before_action :find_favorite, :require_login

  def create
    if FavoriteVenue.create(venue: @venue, user: current_user)
      redirect_to @venue, notice: 'Added to your favorites'
    else
      redirect_to @venue, alert: 'Already added to your favorites'
    end
  end

  def destroy
    if current_user.unfavorite_venue(@venue)
      flash.notice = 'Removed from favorites'
      render 'venues/show'
    else
      flash.alert = 'Not saved as a favorite'
      render 'venues/show'
    end
  end

  private

  def find_favorite
    @venue = Venue.find(params[:venue_id])
  end

  def require_login
    redirect_to controller: 'sessions', action: 'new' unless current_user
    flash.notice = "You must be logged in to add favorites"
  end
end
