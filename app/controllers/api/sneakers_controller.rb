class Api::SneakersController < ApplicationController

  def show
    @sneaker = Sneaker.find_by(id: params[:id])

    render :show
  end

  def index
    # debugger
    # @sneakers = Sneaker
    @sneakers = Sneaker.all.page(1)
    # @sneakers = Sneaker.all

    render :index
  end

  def search
    query = params[:query].downcase

    if query.present?
      @sneakers = Sneaker.where('LOWER(name) ~ :query OR LOWER(brand) ~ :query OR LOWER(designer) ~ :query', query: query)
    else
      @sneakers = Sneaker.none
    end
    
    render :index
  end
  
end
