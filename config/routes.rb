Rails.application.routes.draw do
  devise_for :users
  
  root "login#index"

  resources :products
end
