Rails.application.routes.draw do

  root 'tests#index'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member { post :start }
  end

  resources :test_passings, only: %i[show update] do
    member { get :result }
    end
end
