Rails.application.routes.draw do
  resources :comments
  resources :user_books
  resources :user_events
  resources :reviews
  resources :books
  resources :events
  resources :users
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end