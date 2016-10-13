class Frontend::RaversController < FrontendController
  before_action :authenticate_raver!, :set_lastseen
    
    def date
    end

    def tickets
    end

    def lineup
    end

    def apply
      @application = Application.new
    end

    def createapplication
      application = Application.new
      application.raver = current_raver
      if application.update(application_params)
        redirect_to date_path, notice: "Your Application have been sent, BeAtS will contact you soon!"
      else
        redirect_to date_path, alert: "Error, please try again!"
      end
    end


private 
    def set_raver
	  	@raver = Raver.find(params[:id])
	  end	

  	def application_params
  		params.require(:application).permit(:competance, :motivation)
  	end

    def set_lastseen
      current_raver.last_seen = DateTime.now
      current_raver.save
    end
end
