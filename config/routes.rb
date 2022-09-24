Rails.application.routes.draw do
  root "users#index" # for default route
  resources :posts, only: [:create, :new ]
  resources :users, only: [:index, :show, :new, :create, :destroy] do
    resources :posts, only: [:index, :show]
  end
end
