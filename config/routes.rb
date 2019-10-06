Rails.application.routes.draw do
  post 'login' => 'sessions#new'
  resources :portfolios
  resources :images
  resources :graphickers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
