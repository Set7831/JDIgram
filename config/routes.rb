Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}




  root 'home#index'

  resource :users
  resources :posts

  get '/home', to: 'home#index'
  get '/users/index', to: 'users#index'
  get '/profile/:id', to: 'profile#show', as: :show_profile
  get '/profile/edit', to: 'profile#edit'
  patch '/profile', to: 'profile#update'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
