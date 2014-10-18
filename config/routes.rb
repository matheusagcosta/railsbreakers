Rails.application.routes.draw do
  root 'pages#step1'
  get 'pages/step1'
  get 'pages/step2'
  get 'pages/step3'
  get 'pages/pocket_login' => 'pages#pocket_login', as: :pocket_login
  get 'pages/pocket_callback' => 'pages#pocket_callback', as: :pocket_callback

end
