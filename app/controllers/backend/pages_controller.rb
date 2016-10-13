class Backend::PagesController < BackendController

	def index
		@applications = Application.all
		signin_analytics
	end

	def signin_analytics
		result = []
		@signed_in_today = 0
		@signed_in_now = 0
		@ravers = Raver.all
		@ravers.each do |raver|
			if raver.last_sign_in_at.present?	
				if raver.last_sign_in_at.strftime("%Y%m%d") == Time.now.strftime("%Y%m%d")
					@signed_in_today += 1
				end
				if raver.last_sign_in_at != raver.current_sign_in_at
					@signed_in_now += 1
				end
			end
		end
	end

end
