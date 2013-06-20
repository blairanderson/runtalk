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

  resource :invitations, only: [:new, :create ]

  resource :sessions, only: [:new, :create]

end
