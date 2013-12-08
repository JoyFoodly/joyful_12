Joyfoodly::Application.routes.draw do
  resources :recipe_redirects, only: :show
  resources :foods, only: :show

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'home#index'
end
