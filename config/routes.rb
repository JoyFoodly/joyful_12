Joyfoodly::Application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: { registrations: :registrations, confirmations: :confirmations }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :recipe_redirects, only: :show
  resources :foods, only: [:index, :show]
  resources :users, only: [:edit, :update]
  resources :shopping_lists, only: [:create, :edit, :update]
  resources :seasons, only: :update
  resource :parent_resources, only: :show

  root to: 'home#index'
end
