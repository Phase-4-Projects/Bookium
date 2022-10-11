Rails.application.routes.draw do
  namespace :api do 
    patch "/bookclubs/:id/current-book", to: "bookclubs#current_book"
    resources :book_clubs

    resources :book_club_books, only: [:index, :destroy, :update]
    
    resources :goals, only: [:show, :create, :update, :destroy]
    
    resources :questions, only: [:show, :create, :update, :destroy]
    
    resources :book_club_users
    
    resources :users
  end
  # Routing logic: fallback requests for React Router.
  # Leave this here to help deploy your app later!
  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }
end
