# == Schema Information
#
# Table name: subscribers
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  ticket_num :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'valid_email'

class Subscriber < ActiveRecord::Base
	validates :email, uniqueness: true, email: true

	def self.next_ticket
		aux = Subscriber.maximum(:ticket_num)
		if aux != nil
			return aux.next
		else
			return 1
		end
	end

	def self.reset_tickets
		Subscriber.all.each do |subscriber|
			subscriber.update(ticket_num: nil)
		end
	end
end
