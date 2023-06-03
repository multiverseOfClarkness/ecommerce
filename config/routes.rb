Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers
  
  root "login#index"

  resources :products
end
