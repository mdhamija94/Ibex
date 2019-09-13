class Api::ListingsController < ApplicationController

  def show
    @listing = Listing.find_by(id: params[:id])
  end
  
  def index
    @listings = Sneaker.find_by(id: params[:sneaker_id]).listings

    render :index
  end

end
