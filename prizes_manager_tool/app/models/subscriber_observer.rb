class SubscriberObserver < ActiveRecord::Observer
  
  def after_save(subscriber)
    Rule.all.order('created_at asc').each do |rule|
    	if rule.does_the_rule_match_against?(subscriber.ticket_num)
    		prize = Prize.find(rule.prize_id)
    		quantity = prize.quantity
    		if quantity > 0
    			Delivery.create(prize_id: rule.prize_id)
    			prize.update(quantity: (quantity-1))
    		end
    	end
    end
  end
  
end