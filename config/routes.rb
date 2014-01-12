Joyfoodly::Application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: { registrations: :registrations, confirmations: :confirmations }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :recipe_redirects, only: :show
  resources :foods, only: :show
  resources :users, only: [:edit, :update]
  resources :shopping_lists, only: [:create, :edit, :update]

  root to: 'home#index'
end
