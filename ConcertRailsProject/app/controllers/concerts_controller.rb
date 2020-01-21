class ConcertsController < ApplicationController
  before_action :find_concert, only: [:show, :edit, :destroy]
  
  def index
    @concerts = Concert.all
  end
  
  def show
  end

  def edit
  end

  def new
    @concert = Concert.new
  end

  def create
  end

  def delete
  end

  private 

  def find_concert
    @concert = Concert.find(params[:id])
  end
end
