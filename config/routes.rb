Rails.application.routes.draw do
  root to: 'slides#index'
  resources :slides do 
    member do
      get 'preview'
    end
  end
  devise_for :users
  resources :users, only: :show
end
