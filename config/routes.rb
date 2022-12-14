Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :islands do
    resources :bookings, only: %i[new create]
  end

  resources :bookings, except: %i[new create]
  # Defines the root path route ("/")
  # root "articles#index"
end
