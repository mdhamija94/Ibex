class Api::SneakersController < ApplicationController

  def show
    @sneaker = Sneaker.find_by(id: params[:id])

    render :show
  end

  def index
    @sneaker_count = Sneaker.count
    @sneakers = Sneaker.order(:id).page(params[:page])

    render :index
  end

  def search
    query = params[:query].downcase

    if query.present?
      query_res = Sneaker.where('LOWER(name) ~ :query OR LOWER(brand) ~ :query OR LOWER(designer) ~ :query', query: query)
      @sneaker_count = query_res.count
      @sneakers = query_res.order(:id).page(params[:page])
    else
      @sneaker_count = 0
      @sneakers = []
    end
    
    render :index
  end
  
end
