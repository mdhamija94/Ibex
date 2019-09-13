import * as ListingUtil from '../util/listing_api_util';

export const RECEIVE_LISTINGS = "RECEIVE_LISTINGS";

const receiveListings = (listings) => ({
  type: RECEIVE_LISTINGS,
  listings
});

