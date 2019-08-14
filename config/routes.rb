Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}




  root 'home#index'

  resources :users do
    resources :profile
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
