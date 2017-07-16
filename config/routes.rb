Rails.application.routes.draw do
  root to: 'slides#index'
  resources :slides
  devise_for :users
end
