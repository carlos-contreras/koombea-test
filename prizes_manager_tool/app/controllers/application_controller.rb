class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def delivery_handler(visitor)
	deliver = Delivery.next_to_deliver
	if deliver
	  deliver.update(subscriber: visitor)
	  redirect_to :back, notice: "YOU JUST WON! Your prize is a [#{deliver.prize.name}]: #{deliver.prize.description}. Your prize will be sent to your email VERY SOON!"
	else
	  redirect_to :back, notice: "Good try, but you didn't made it, try again tomorrow."
	end
  end
end
