# == Schema Information
#
# Table name: listings
#
#  id         :bigint           not null, primary key
#  sneaker_id :integer          not null
#  size       :float            not null
#  price      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Listing < ApplicationRecord
  validates :sneaker_id, :size, :price, presence: true
end
