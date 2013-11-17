Joyfoodly::Application.routes.draw do
  resources :foods
  root to: 'home#index'
end
