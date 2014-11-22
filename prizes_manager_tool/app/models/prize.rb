# == Schema Information
#
# Table name: prizes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  quantity    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Prize < ActiveRecord::Base
	validates :name, presence: true
	validates :quantity, :numericality => { :greater_than => -1 }
end
