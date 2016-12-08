Rails.application.routes.draw do
  get 'account_switch/to_user'

  get 'account_switch/to_organization'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'posts/index'
  get 'posts/new'
  post 'posts/new',   to: 'posts#create'
  root 'posts#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
