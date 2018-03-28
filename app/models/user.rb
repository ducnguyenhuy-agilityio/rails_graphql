# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string           not null
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password

  has_many :rentals
  has_many :bookings
  has_many :rentals

  validates :name, :password_digest, presence: true
  validates :email, presence: true, uniqueness: true
end
