class LandingController < ApplicationController
  
  #before_action :set_prize, only: [:get_prize]

  # GET /
  def index
  end

  # POST /subscription
  def subscription
  	visitor = Subscriber.find_by :email => params[:email]
  	if visitor
  		unless visitor.ticket_num
  			visitor.ticket_num = Subscriber.next_ticket
  			visitor.save
  			sleep(2)
  			deliver = Delivery.next_to_deliver
  			if deliver
				deliver.subscriber = visitor
				deliver.save
				redirect_to :back, notice: "YOU JUST WON! Your prize is a [#{deliver.prize.name}]: #{deliver.prize.description}. Your prize will be sent to your email VERY SOON!"
  			else
  				redirect_to :back, notice: "Good try, but you didn't made it, try again tomorrow."
  			end
  		else
  			redirect_to :back, alert: "Your email is already registered for today! please try again tomorrow."
  		end
  	else
  		visitor = Subscriber.new do |s|
	  		s.email = params[:email]
	  		s.ticket_num = Subscriber.next_ticket
	  	end
	  	if visitor.valid?
	  		visitor.save
	  		sleep(2)
	  		deliver = Delivery.next_to_deliver
  			if deliver
				deliver.subscriber = visitor
				deliver.save
				redirect_to :back, notice: "YOU JUST WON! Your prize is a [#{deliver.prize.name}]: #{deliver.prize.description}. Your prize will be sent to your email VERY SOON!"
  			else
  				redirect_to :back, notice: "Good try, but you didn't made it, try again tomorrow."
  			end
	  	else
	  		redirect_to :back, alert: "You entered an invalid email, please try again."
  		end
  	end
  end

  def set_prize
  	@prize = Prize.find(params[:id])
  end
end
