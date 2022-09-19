Rails.application.routes.draw do
  get '/', to: 'users#index'
  get '/users/:id', to: 'users#singleuser'
  get '/users/:id/posts', to: 'users#userposts'
  get '/users/:id/posts/:id', to: 'users#singlepost'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
