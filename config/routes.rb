Rails.application.routes.draw do
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'welcomes#index'

  get '/dashboard', to: 'welcomes#dashboard'
  get '/users/:id', to: 'users#profile', as: 'profile'
  
  resources :jobs do
    resources :bids, shallow: true
  end
end
