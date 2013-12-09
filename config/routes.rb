Joyfoodly::Application.routes.draw do
  devise_for :admins
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :recipe_redirects, only: :show
  resources :foods, only: :show
  resources :users, only: :show

  root to: 'home#index'
end
