# == Schema Information
#
# Table name: deliveries
#
#  id            :integer          not null, primary key
#  subscriber_id :integer
#  prize_id      :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class DeliveryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
