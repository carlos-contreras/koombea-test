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

class Delivery < ActiveRecord::Base
  validates :prize, presence: true

  belongs_to :subscriber
  belongs_to :prize

  def self.next_to_deliver
    Delivery.where(subscriber_id: nil).order('created_at desc').last
  end

end
