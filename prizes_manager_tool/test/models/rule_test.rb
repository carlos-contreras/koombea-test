# == Schema Information
#
# Table name: rules
#
#  id           :integer          not null, primary key
#  numbers      :string(255)
#  before       :integer
#  after        :integer
#  prize_id     :integer
#  created_at   :datetime
#  updated_at   :datetime
#  rule_type_id :integer
#

require 'test_helper'

class RuleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
