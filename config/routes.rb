Joyfoodly::Application.routes.draw do

  devise_for :admins
  devise_for :users, controllers: { registrations: :registrations, passwords: :passwords, confirmations: :confirmations }
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :recipe_redirects, only: :show
  resources :foods, only: [:index, :show], path: 'classroom' do
    resources :recipes, only: [] do
      get 'print_view'
    end
    get ':recipe_slug' => 'comment_thread_sources#show'
    get ':recipe_slug/comments' => 'comments#index'
  end
  resources :users, only: [:edit, :update] do
    get 'change_password', on: :member
  end

  resources :payment

  resources :shopping_lists, only: [:create, :edit, :update, :show, :destroy]
  resources :shopping_list_emails, only: :create
  resources :seasons, only: :update
  resource :parent_resources, only: :show
  resource :videos, only: :show
  resource :class_schedule
  resources :pages, only: :show
  resources :wait_lists, only: [:new, :create, :show]
  resources :testing_signup, only: :index
  resources :contact_forms, only: :create
  resources :forms, only: [:create, :show] do
    get 'submitted', on: :member
  end
  get 'almost_there' => 'home#confirmation_sent', as: :confirmation_sent
  get 'community_sessions' => 'community_sessions#show'

  resources :recipes, only: [:show]

  resources :upgrades, only: [:index, :create, :show]

  root to: 'home#rootpage'
  get "/about" => "home#page"
  
  # catch all to enable marketing links
  get '/:tracking_slug' => 'home#marketing'
end
