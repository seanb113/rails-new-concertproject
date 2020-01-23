class UpcomingConcertsController < ApplicationController
  before_action :find_favorite, :require_login

  def create
    if UpcomingConcert.create(concert: @concert, user: current_user)
      redirect_to @concert, notice: 'RSVPed'
    else
      redirect_to @concert, alert: 'Already RSVPed'
    end
  end

  def destroy
    if current_user.not_attending(@concert)
      flash[:notice] = 'Removed from upcoming events.'
      render 'concerts/show'
    else
      flash[:alert] = 'You did not RSVP to this event'
      render 'concerts/show'
    end
  end

  private

  def find_favorite
    #byebug
    @concert = Concert.find(params[:concert_id])
  end

  def require_login
   redirect_to controller: 'sessions', action: 'new' unless current_user
   flash.notice = "You must be logged in to RSVP"
  end

end
