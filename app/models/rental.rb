# == Schema Information
#
# Table name: rentals
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  rental_type  :string           not null
#  accommodates :integer          not null
#  bathrooms    :integer          not null
#  bedrooms     :integer          not null
#  beds         :integer          not null
#  nightly_cost :decimal(8, 2)    not null
#  description  :text
#  latitude     :decimal(10, 6)
#  longitude    :decimal(10, 6)
#  street1      :string           not null
#  street2      :string
#  city         :string           not null
#  province     :string
#  country      :string           not null
#  postal_code  :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Rental < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews

  validates :user, :rental_type, :accommodates, :bathrooms,
    :bedrooms, :beds, :nightly_cost, :street1, :city,
    :country, presence: true

  scope :by_created_at, ->(direction) { order created_at: direction }
  scope :by_updated_at, ->(direction) { order updated_at: direction }

  def is_featured
    featured == true
  end
end
