Rails.application.routes.draw do
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'posts/index'
  get 'posts/new'
  post 'posts/new',   to: 'posts#create'
  root 'posts#welcome'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
