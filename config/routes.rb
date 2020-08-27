Rails.application.routes.draw do
	root 'demo_apps#home'
	get  '/help', to: 'demo_apps#help'
	get  '/about', to: 'demo_apps#about'
	get  '/contact', to: 'demo_apps#contact'
	
	get '/signup', to: 'users#new'
	get '/login', to: 'sessions#new'
	post '/login', to: 'sessions#create'
	delete '/logout', to: 'sessions#destroy'
	resources :users do
		member do
			get :following, :followers
		end
	end
	resources :users
	resources :microposts, only: [:create, :destroy]
	resources :relationships, only: [:create, :destroy]
end
