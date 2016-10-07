class Frontend::RaversController < FrontendController
  before_action :authenticate_raver!
    
    def date
    end

    def tickets
    end

    def lineup
    end


private 
    def set_raver
	  	@raver = Raver.find(params[:id])
	  end	

  	def raver_params
  		params.require(:raver).permit(:email, :name , :surname , :town, :phone)
  	end
end
