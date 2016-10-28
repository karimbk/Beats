class Ticket < ActiveRecord::Base
    enum status: [ :open, :out, :paid ,:checked_in]

    def open
    	open!
    	if save 
    		return true
    	else
    		return false
    	end
    end

    def out
    	out!
    	if save 
    		return true
    	else
    		return false
    	end
    end

    def pay
    	paid!
    	if save 
    		return true
    	else
    		return false
    	end
    end

    def check
    	checked_in!
    	if save 
    		return true
    	else
    		return false
    	end
    end
end
