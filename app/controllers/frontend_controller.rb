class FrontendController < ApplicationController
	layout 'frontend'
	 before_action :set_admin , only: [:info]

	def info
     
	end

end
