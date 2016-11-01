class Backend::PagesController < BackendController

	def index
		@hostname = request.host
		@applications = Application.all
		town_analytics
		signin_analytics
	end

	def online_users
		signin_analytics
	end

	private

	def signin_analytics
		@onlinenow_results = []
		@onlinetoday_results = []
		@signed_in_today = 0
		@signed_in_now = 0
		@ravers = Raver.all
		@ravers.each do |raver|
			if raver.last_sign_in_at.present?	
				if raver.last_sign_in_at.strftime("%Y%m%d") == Time.now.strftime("%Y%m%d")
					@signed_in_today += 1
					@onlinetoday_results.push(raver)
				end
			end
			if raver.last_seen.present?
				if (Time.now - raver.last_seen < 5.minutes)
					@signed_in_now += 1
					@onlinenow_results.push(raver)
				end
			end
		end
	end

	def town_analytics
		ravers = Raver.order(region: :desc)
		@stat_town = ravers.group(:region).limit(20).count
		hash = ravers.group(:region).offset(20).count
		rest = hash.inject(0) { |sum, tuple| sum += tuple[1] }
		@stat_town[:autre] = rest
	end

end
