class UpcomingConcertsController < ApplicationController
  before_action :find_favorite, :require_login

  def create
    #byebug
    if UpcomingConcert.create(concert: @concert, user: current_user).errors.messages.empty?
      redirect_to @concert, notice:  'RSVPed'
    else
      redirect_to @concert, notice: 'Already RSVPed'
    end
  end

  def destroy
    if current_user.not_attending(@concert)
      redirect_to @concert, notice: 'Removed from upcoming events.'
      #render 'concerts/show'
    else
      redirect_to @concert, notice: 'You did not RSVP to this event'
    end
  end

  private

  def find_favorite
    #byebug
    @concert = Concert.find(params[:concert_id])
  end

  def require_login
   redirect_to controller: 'sessions', action: 'new' unless current_user
   flash.now.notice = "You must be logged in to RSVP"
  end

end
