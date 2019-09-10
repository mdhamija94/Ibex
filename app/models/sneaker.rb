# == Schema Information
#
# Table name: sneakers
#
#  id           :bigint           not null, primary key
#  name         :string           not null
#  sku          :string           not null
#  description  :text             not null
#  release_date :date             not null
#  colorway     :string           not null
#  brand        :string           not null
#  silhouette   :string           not null
#  technology   :string           not null
#  designer     :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Sneaker < ApplicationRecord

  validates :name, :description, :sku, :release_date, :colorway, :brand, :silhouette, :technology, :designer, presence: true
  
end
