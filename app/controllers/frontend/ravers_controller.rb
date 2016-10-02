class Frontend::RaversController < FrontendController
  before_action :authenticate_raver!


    def new
    @gif_background = ActionController::Base.helpers.asset_path('beats4.gif')
		@raver = Raver.new
		session[:email] = params[:email]
    end
   	
   	def create
   		raver = Raver.new(raver_params)
   		raver.email = session[:email]
   		if raver.save 
   			redirect_to ravers_date_path
   		else
   			redirect_to root
   		end
   	end


private 
    def set_raver
	  	@raver = Raver.find(params[:id])
	  end	

  	def raver_params
  		params.require(:raver).permit(:email, :name , :surname , :town, :phone)
  	end
end
