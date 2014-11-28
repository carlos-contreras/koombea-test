class LandingController < ApplicationController

  # GET /
  def index
  end

  # POST /subscription
  def subscription
  	visitor = Subscriber.find_by :email => params[:email]
  	if visitor
  		unless visitor.ticket_num
  			visitor.update(:ticket_num => Subscriber.next_ticket)
        delivery_handler(visitor)
  		else
  			redirect_to :back, alert: "Your email is already registered for today! please try again tomorrow."
  		end
  	else
  		visitor = Subscriber.new ({ :email => params[:email], :ticket_num => Subscriber.next_ticket })
	  	if visitor.save
        delivery_handler(visitor)
	  	else
	  		redirect_to :back, alert: "You entered an invalid email, please try again."
  		end
  	end
  end

end