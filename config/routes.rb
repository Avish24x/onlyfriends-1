Rails.application.routes.draw do
  get 'bookings/index'
  # get 'fake_friends/index'
  # get 'fake_friends/create'
  # get 'fake_friends/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :fake_friends do
    resources :bookings
    resources :categories
  end
  resources :bookings, only: %i[destroy index]
  resources :categories, only: %i[destroy]

  resources :users
  # resources :bookings, only: [:destroy]
end
