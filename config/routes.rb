Rails.application.routes.draw do
  root 'pages#step1'
  get 'pages/step1'
  get 'pages/step2'
  get 'pages/step3'
end
