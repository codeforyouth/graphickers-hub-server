Rails.application.routes.draw do
  post 'login' => 'sessions#create'
  post 'logout' => 'sessions#destroy'

  get 'graphickers/:id/portfolios' => 'graphickers#portfolios'
  put 'graphickers/:id/avatar' => 'graphickers#avatar'

  put 'portfolios/:id/avatar' => 'portfolios#avatar'
  delete 'portfolios/:id/avatar/:avatar_index' => 'portfolios#delete_avatar'

  resources :portfolios
  resources :images
  resources :graphickers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
