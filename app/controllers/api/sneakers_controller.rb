class Api::SneakersController < ApplicationController

  def show
    @sneaker = Sneaker.find_by(id: params[:id])

    render :show
  end

  def index
    @sneaker_count = Sneaker.all.count
    @sneakers = Sneaker.order(:id).page(params[:page])

    render :index
  end

  def search
    query = params[:query].downcase

    if query.present?
      query_res = Sneaker.where('LOWER(name) ~ :query OR LOWER(brand) ~ :query OR LOWER(designer) ~ :query', query: query)
      @sneakers = query_res.order(:id).page(params[:page])
      @sneaker_count = query_res.count
    else
      query_res = Sneaker.none
      @sneaker_count = query_res.count
    end
    
    render :search
  end
  
end
