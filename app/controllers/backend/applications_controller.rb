class Backend::ApplicationsController < BackendController
	
	def index
		@applications = Application.order(created_at: :desc)
	end

	def show
		@application = Application.find(params[:id])
	end

	def destroy
		@application = Application.find(params[:id])
		if @application.destroy
			redirect_to backend_applications_path ,notice: "Candidature supprime"
		else
			redirect_to bakend_applications_controller(@raver), notice: "problem! Candidature n'a pas ete suprrime"
        end
	end 	
end
