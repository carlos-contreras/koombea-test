# == Schema Information
#
# Table name: rule_types
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#

class RuleType < ActiveRecord::Base
end
