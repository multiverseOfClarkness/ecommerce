Rails.application.routes.draw do
  get 'home/home'
  # config/routes.rb
  devise_for :users, controllers: { sessions: 'sessions' }

  
  root "home#home"

  resources :products

  resource :cart, only: [:show, :update] do
    post 'add_item', on: :member
    delete 'remove_item', on: :member
  end
end
