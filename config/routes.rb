Rails.application.routes.draw do
  resources :profiles
  get '/profiles/search', to: 'profiles#search_bar'
  get '/profiles/filter', to: 'profiles#filter'

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "profiles#index"
end
