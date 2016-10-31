class Backend::GuestlistsController < BackendController
	before_action :set_guest, only: [:edit, :update, :destroy]
	
	def index
		@guests = Guestlist.all
	end

	def new
		@guest = Guestlist.new
	end

	def create
		guest = Guestlist.new(guestlist_params)
		if guest.save
			redirect_to backend_guestlists_path, notice: "Guest added to guestlist successfully"
		else
			redirect_to new_backend_guestlist_path, alert: "Oups! there was problem!"
		end
	end

	def edit
	end

	def update
		if @guest.update(guestlist_params)
			redirect_to backend_guestlists_path, notice: "Guest Updated successfully"
		else
			redirect_to new_backend_guestlist_path, alert: "Oups! there was problem!"
		end

	end

	def destroy
		if @guest.destroy 
			redirect_to backend_guestlists_path, notice: "Guest deleted!"
		else
			redirect_to new_backend_guestlist_path, alert: "Oups! there was problem!"
		end
	end



	private

    def guestlist_params
		params.require(:guestlist).permit(:name,:number)
    end

    def set_guest
    	@guest = Guestlist.find(params[:id])
    end
end
