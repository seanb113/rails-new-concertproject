class UpcomingConcertsController < ApplicationController
  def create
    current_user.upcoming_concert(@concert)
    render 'concerts/show'
  end

  def destroy
    current_user.not_attending(@concert)
    render 'concerts/show'
  end

  private
  def find_upcoming
    @concert = UpcomingConcert.find(:params[:concert])
  end
end
