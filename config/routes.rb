Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path_names: { sign_in: :login, sign_out: :logout }, controllers: { sessions: 'sessions' }

  resources :tests, only: :index do
    member { post :start }
  end

  resources :test_passings, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :gists, action: :create
  resources :feedback, only: %i[create new]
  resources :badges, only: :index

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: %i[index] do
        resources :answers, shallow: true, except: %i[index]
      end
    end
    resources :gists, only: :index
    resources :badges
  end
end
