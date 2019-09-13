@listings.each do |listing|
  json.set! listing.id do
    json.extract! listing, :id, :sneaker_id, :size, :price
    # if sneaker.photo.attached? 
    #   json.photoUrl url_for(sneaker.photo)
    # else
    #   json.photoUrl ""
    # end
  end
end