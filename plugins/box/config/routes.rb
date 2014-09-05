# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
# resources :projects do

	 resources :boxelements
	 get '/fileviews', to: "fileviews#index"

#	end