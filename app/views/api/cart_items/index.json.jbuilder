json.cart_items do
  @cart_items.each do |cart_item|
    json.set! cart_item.id do
      json.extract! cart_item, :id, :user_id, :listing_id
      json.sneakerId cart_item.listing.sneaker.id
      json.sneakerName cart_item.listing.sneaker.name
      json.sku cart_item.listing.sneaker.sku
      json.price cart_item.listing.price
      json.size cart_item.listing.size
      if cart_item.listing.sneaker.photo.attached? 
        json.photoUrl url_for(cart_item.listing.sneaker.photo)
      else
        json.photoUrl ""
      end 
    end
  end
end

# json.listings do
#   @cart_items.each do |cart_item|
#     json.set! cart_item.id do
#       json.extract! cart_item.listing, :id, :size, :price
#     end
#   end
# end

# json.sneakers do
#   @cart_items.each do |cart_item|
#     json.set! cart_item.id do
#       json.extract! cart_item.listing.sneaker, :id, :name

#      if cart_item.listing.sneaker.photo.attached? 
#         json.photoUrl url_for(cart_item.listing.sneaker.photo)
#       else
#         json.photoUrl ""
#       end 
#     end
#   end
# end

# CartItem.new({ user_id: 16, listing_id: 8632 })