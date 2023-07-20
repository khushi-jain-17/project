Rails.application.routes.draw do
  devise_for :users	 
  root "movies#index"
  
  get "/about" ,to: "movies#about"
  get "/search" ,to: "movies#search"
  resources :category
  resources :movies do
  	resources :reviews
  end
  	
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   
end
