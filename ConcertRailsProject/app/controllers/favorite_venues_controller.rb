class FavoriteVenuesController < ApplicationController
  before_action :find_favorite, :require_login

  def create
    if FavoriteVenue.create(venue: @venue, user: current_user).errors.messages.empty?
      redirect_to @venue, notice: 'Added to your favorites'
    else
      redirect_to @venue, notice: 'Already added to your favorites'
    end
  end

  def destroy
    if current_user.unfavorite_venue(@venue)
      flash.now.notice =  'Removed from favorites'
      render 'venues/show'
    else
      flash.now.notice =  "This venue isn't in your favorites"
      render 'venues/show'
    end
  end

  private

  def find_favorite
    @venue = Venue.find(params[:venue_id])
  end

  def require_login
    redirect_to controller: 'sessions', action: 'new' unless current_user
    flash.now.notice =  "You must be logged in to add favorites"
  end
end
