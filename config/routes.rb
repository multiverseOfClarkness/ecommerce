Rails.application.routes.draw do
  get 'home/home'
  # config/routes.rb
  devise_for :admins, controllers: { sessions: 'sessions' }
  devise_for :customers, controllers: { sessions: 'sessions' }

  
  root "home#home"

  resources :products
end
