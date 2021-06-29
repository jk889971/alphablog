Rails.application.routes.draw do
  root 'articles#index'
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'
  get '/user/:id/settings', to: 'users#edit'
  resources :users, except: [:new, :edit]
end