Rails.application.routes.draw do
  resources :restaurants
  devise_for :users
  root to: 'pages#home'
end
