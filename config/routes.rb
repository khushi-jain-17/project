Rails.application.routes.draw do
  devise_for :users	 
  root "movies#index"
  
  get "/about" ,to: "movies#about"
  get "/search" ,to: "movies#search"
  
  get '/category', to: 'categories#index', as: :category_movies

  resources :movies do
  	resources :reviews
  end

   
end
