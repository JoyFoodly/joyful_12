Joyfoodly::Application.routes.draw do
  devise_for :admins
  devise_for :users, controllers: { registrations: :registrations, passwords: :passwords, confirmations: :confirmations }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :recipe_redirects, only: :show
  resources :foods, only: [:index, :show]
  resources :users, only: [:edit, :update] do
    get 'change_password', on: :member
  end
  resources :shopping_lists, only: [:create, :edit, :update, :show, :destroy]
  resources :shopping_list_emails, only: :create
  resources :seasons, only: :update
  resource :parent_resources, only: :show
  resource :class_schedule
  resources :pages, only: :show
  resources :wait_lists, only: [:new, :create, :show]
  resources :forms, only: [:create, :show] do
    get 'submitted', on: :member
  end
  get 'almost_there' => 'home#confirmation_sent', as: :confirmation_sent

  root to: 'foods#index'
end
