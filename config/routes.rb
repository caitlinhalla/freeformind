Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"

  resources :users do
    resources :products
  end

  resources :products do
    resources :reviews, :except => [:show, :index]
  end
end
