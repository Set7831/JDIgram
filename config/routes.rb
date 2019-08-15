Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}




  root 'home#index'

  #resource :profile, only: [:edit, :update]


    get '/profile', to: 'profile#edit'
    patch '/profile', to: 'profile#update'
  get '/profile', to: 'profile#edit_password', as: :edit_password



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
