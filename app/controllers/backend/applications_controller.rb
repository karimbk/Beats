class Backend::ApplicationsController < BackendController
	
	def index
		@applications = Application.order(created_at: :desc)
	end

	def show
		@application = Application.find(params[:id])
	end
end
