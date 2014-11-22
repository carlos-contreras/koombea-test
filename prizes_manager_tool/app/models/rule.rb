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

class Rule < ActiveRecord::Base
  belongs_to :prize
  belongs_to :rule_type

  validates :after, :numericality => { :greater_than => 0 }
  validates :before, :numericality => { :greater_than => 0 }
  validates :prize, presence: true
  validates :rule_type, presence: true
  
  validate :numbers_validator
  validate :range_in_beetwen

  def range_in_beetwen
    if self.before < self.after
      errors.add(:before, "Can't be greater that ->safter")
    end
  end

  def numbers_validator
  	unless parse_numbers
      errors.add(:numbers, "Invalid numbers")
    end
  end

  def parse_numbers
    if self.numbers.nil? or self.numbers.empty?
      return nil
    else
      array = Array.new
      self.numbers.delete(' ').split(',').each do |n|
        if n.is_integer?
          array << n.to_i
        else
          retrun nil   
        end
      end
    end
    return array
  end

  def does_the_rule_match_against?(position)
    case self.rule_type_id
    when 1 then
      if self.parse_numbers.include?(position) and position < self.before and position > self.after
        return true
      else
        return false
      end
    when 2 then
      self.parse_numbers.each do |i|
        if position%i == 0 and position < self.before and position > self.after
          return true
        end
      end
      return false
    when 3 then
      if rand < (1.0/self.parse_numbers[0].to_f) and position < self.before and position > self.after
        return true
      else
        return false
      end
    end
  end

end
