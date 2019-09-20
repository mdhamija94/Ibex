class Api::CartItemsController < ApplicationController

  def index
    @cart_items = current_user.cart_items

    render :index
  end

  def create
    @cart_item = CartItem.new(cart_item_params)

    if @cart_item.save
      render :show
    else
      render json: @cart_item.errors.full_messages, status: 422
    end

    # use parameters from ajax post
    # status codes 200 on sucess to trigger success callback (only push user to cart on success)
    # 404 or something on failure 
    # dispatch ajax request directly from button and chain on .then to go to cart 
  end

  def destroy
    @cart_item = CartItem.find_by(id: params[:id])
    @cart_item.destroy
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:user_id, :listing_id)
  end

end
