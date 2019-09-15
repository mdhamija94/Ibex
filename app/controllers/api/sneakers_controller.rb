class Api::SneakersController < ApplicationController

  def show
    @sneaker = Sneaker.find_by(id: params[:id])

    render :show
  end

  def index
    @sneakers = Sneaker.all

    render :index
  end

  def search
    query = params[:query].downcase
    debugger
    @search_results = Sneaker.all.select do |sneaker|
      debugger
      sneaker.name.downcase.include?(query)
    end

    render :index
  end
  
end
