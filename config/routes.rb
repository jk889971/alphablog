Rails.application.routes.draw do
  root 'articles#index'
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
end