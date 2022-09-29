Rails.application.routes.draw do
  
  root "users#index" # for default route
  
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  # devise_for :users, controllers: {
  #   sessions: 'users/sessions'
  # }
  
  resources :posts, only: [:create, :new ]
  resources :users, only: [:index, :show, :new, :create, :destroy] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end
end
