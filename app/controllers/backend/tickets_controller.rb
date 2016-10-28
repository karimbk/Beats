class Backend::TicketsController < BackendController

	before_action :set_ticket, only: [:give, :pay, :check, :reopen, :destroy]
    
    def index
        @tickets = Ticket.order(id: :desc)
	end

	def generate_ticket
		if params[:token] == "ticketskey"
			t = DateTime
			code = t.now.strftime("%m%d%S%L").reverse.to_i
			ticket = Ticket.new(code: code)
			if ticket.save 
				redirect_to backend_tickets_path, notice: "Ticket was successfully generated"
			else
				redirect_to backend_tickets_path, alert: "there was a problem"
			end
		else
			redirect_to backend_tickets_path, alert: "Sorry! wrong password"
		end
	end

    def give
    	if @ticket.out 
    		redirect_to backend_tickets_path, notice: "you gave out the ticket"
    	else
    		redirect_to backend_tickets_path, alert: "There was a problem"
    	end
    end

    def pay
    	if @ticket.pay 
    		redirect_to backend_tickets_path, notice: "Ticket paid"
    	else
    		redirect_to backend_tickets_path, alert: "There was a problem"
    	end
    end

    def check
    	if @ticket.check 
    		redirect_to backend_tickets_path, notice: "Raver checked in"
    	else
    		redirect_to backend_tickets_path, alert: "There was a problem"
    	end
    end

    def reopen
    	if @ticket.open 
    		redirect_to backend_tickets_path, notice: "The ticket was reopened"
    	else
    		redirect_to backend_tickets_path, alert: "There was a problem"
    	end
    end

    private

    def set_ticket
    	@ticket = Ticket.find(params[:id])
    end
end
