# frozen_string_literal: true

Rails.application.routes.draw do
  root 'posts#index', as: 'home' # Nurodau pagrindini puslapi
  # posts kontroleris, index view

  # Nurodau get metoda (about url) kuris yra nukreiptas i pages kontroleri about metoda(view)
  get 'about' => 'pages#about'
  get 'services' => 'pages#services'

  # login
  get 'login' => 'users#login'
  post 'login_user' => 'users#login_user'
  get 'logout' => 'users#logout'
  # register
  get 'register' => 'sessions#register'
  post 'create_user' => 'sessions#create_user'

  # Kad nereiketu kurti rankiniu butu, sukuria uz mane marsrutus. Taip pat nurodau kad pereinu per visus comments route
  resources :posts do
    resources :comments
  end
end
