Rails.application.routes.draw do
  post 'sync', to: 'sync#create'

  root 'pages#step1'
  get 'pages/step1'
  get 'pages/step2'

  get 'pages/pocket_login' => 'pages#pocket_login', as: :pocket_login
  get 'pages/pocket_callback' => 'pages#pocket_callback', as: :pocket_callback

  get '/auth/:provider/callback', to: 'sessions#create', as: :auth_callback
  get '/auth/failure', to: 'sessions#failure'
end
