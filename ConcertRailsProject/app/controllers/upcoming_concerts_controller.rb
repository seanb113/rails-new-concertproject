class UpcomingConcertsController < ApplicationController
  before_action :find_favorite

  def create
    if current_user.upcoming_concert(@concert)
      redirect_to :back, flash[:notice] = "You're going to #{@concert.name}"
    else
      redirect_to :back, flash[:alert] = "This concert has already been added"
    end

  end

  def destroy
    if current_user.not_attending(@concert)
      flash[:notice] = 'Removed from upcoming events.'
    else
      flash[:alert] = "You did not RSVP to this event"
    end
  end

  private

  def find_favorite
    #byebug
    @concert = Concert.find(params[:concert_id])
  end

end
