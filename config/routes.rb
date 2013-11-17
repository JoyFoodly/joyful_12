Joyfoodly::Application.routes.draw do
  resources :recipe_redirects, only: :show
  resources :foods, only: :show
  root to: 'home#index'
end
