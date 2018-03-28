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

require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
