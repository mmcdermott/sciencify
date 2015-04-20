Rails.application.routes.draw do
  devise_for :users
  authenticated :user do 
    #root to: 'users#main'
    get '/', to: 'users#main'
  end

  root to: 'pages#main'

  get "/about", to: 'pages#about'

  resources :users, except: [:index], shallow: true do
    resource :profile, only: [:show, :edit, :update]
    #TODO: Make this only use path: 'tests' for show, index
    resources :registrations, except: [:new, :create, :show], path: 'metrics'
    resources :registration,  only:   [:show]
    member do
      get 'created_tests'
    end
  end

  resources :metrics, except: [:edit, :update, :destroy], shallow: true do
    resources :registrations, only: [:new, :create]
    resources :questions, except: [:edit, :update, :destroy] do
      post 'submit', on: :member
    end
  end
end
