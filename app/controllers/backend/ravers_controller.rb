class Backend::RaversController < BackendController
	
	def index
		@ravers = Raver.order(created_at: :desc).paginate(:page => params[:page], :per_page => 500)
		ravers = Raver.order(region: :desc)
		@stat_town = ravers.group(:region).limit(25).count
		hash = ravers.group(:region).offset(25).count
		rest = hash.inject(0) { |sum, tuple| sum += tuple[1] }
		@stat_town[:autre] = rest
	end

	def show
		@raver = Raver.find(params[:id])
	end

    def edit
     	@raver = Raver.find(params[:id])
     end

    def update
    	@raver = Raver.find(params[:id])
    	if @raver.update(raver_param)
    	redirect_to backend_ravers_path ,notice: "Raver mise a jour"
    	end	
     end



	def destroy
		@raver = Raver.find(params[:id])
		if @raver.destroy
			redirect_to backend_ravers_path , notice: "Raver supprime"
		else
			redirect_to bakend_raver_controller(@raver), notice: "problem! raver n'a pas ete suprrime"
        end
	end 

	def clean_db
		ravers = Raver.all
		ravers.each do |raver|
			raver.set_region
		end
		redirect_to backend_ravers_path, notice: "Database cleaned, and regions set"
	end

	private

    def raver_param
    	params.require(:raver).permit(:name,:surname,:email,:town,:phone,:gender)
    end
end
