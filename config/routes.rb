Rails.application.routes.draw do
  get 'home/home'
  # config/routes.rb
  devise_for :users, controllers: { sessions: 'sessions' }

  
  root "home#home"

  resources :products
end
