# == Schema Information
#
# Table name: bookings
#
#  id              :integer          not null, primary key
#  user_id         :integer          not null
#  rental_id       :integer          not null
#  start_date      :date             not null
#  stop_date       :date             not null
#  guests          :integer          not null
#  review_score    :integer
#  review_comments :text
#  reviewed_at     :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :rental
  has_one :review

  validates :user, :rental, :start_date, :stop_date,
    :guests, presence: true

  enum status:  { pending: 0, actived: 1, completed: 2, cancelled: 3 }
end
