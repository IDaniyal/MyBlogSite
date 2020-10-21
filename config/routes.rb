Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users
  get 'home/index'
  resources :blogs do
    resources :comments
    resources :upload, only: [:destroy]
  end
  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
