RuntalkChat::Application.routes.draw do
  get "sessions/new"
  get "users/new"

  get "locations/create"

  root 'chats#index'
  
  resources :chats do 
    resources :messages
    resources :locations, only: [:new, :create]
  end

  resource :users

  post "users/add"
  get "users/add"
  post "users/invite"

  resource :sessions

end
