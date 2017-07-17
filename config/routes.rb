Rails.application.routes.draw do
  root to: 'slides#index'
  resources :slides
  devise_for :users
  resources :users, only: :show, path: '/', param: :username
  get '/:username/:title', to: 'slides#preview'
end
