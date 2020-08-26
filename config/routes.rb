Rails.application.routes.draw do
  get 'users/new'
	root 'demo_apps#home'
	get  '/help', to: 'demo_apps#help'
	get  '/about', to: 'demo_apps#about'
	get  '/contact', to: 'demo_apps#contact'
	
	get '/signup', to: 'users#new'
	resources :users
	
end
