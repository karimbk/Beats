class BackendController < ApplicationController
	layout 'backend'
	http_basic_authenticate_with name: "amine.belkhiria@yahoo.fr", password: "beats1234"

	def index	
	end
end
