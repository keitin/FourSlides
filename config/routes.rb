Rails.application.routes.draw do
  root to: 'slides#index'
  devise_for :users
end
