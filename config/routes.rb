Joyfoodly::Application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: { registrations: :registrations, passwords: :passwords, confirmations: :confirmations }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :recipe_redirects, only: :show
  resources :foods, only: [:index, :show]
  resources :users, only: [:edit, :update]
  resources :shopping_lists, only: [:create, :edit, :update]
  resources :seasons, only: :update
  resource :parent_resources, only: :show
  resource :class_schedule
  resources :pages, only: :show
  resources :wait_lists, only: [:new, :create, :show]
  resources :forms, only: [:create, :show] do
    get 'submitted', on: :member
  end

  root to: 'foods#index'
end
