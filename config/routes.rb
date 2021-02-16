Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users,
           controllers: {sessions: "sessions"},
           path: :gurus,
           path_names: { sign_in: :login, sign_out: :logout  }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
    post :gist
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
  end

end
