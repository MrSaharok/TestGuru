Rails.application.routes.draw do
  resources :tests do
    resources :questions
    resources :questions, shallow: true
  end
  end
