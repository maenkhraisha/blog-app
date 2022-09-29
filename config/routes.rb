Rails.application.routes.draw do
  devise_for :users
  root "users#index" # for default route
  resources :posts, only: [:create, :new ]
  resources :users, only: [:index, :show, :new, :create, :destroy] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end
end
