RuntalkChat::Application.routes.draw do
  get "users/new"

  get "locations/create"

  root 'chats#index'
  
  resources :chats do 
    resources :messages
    resources :locations, only: [:new, :create]
  end

  resource :users

end
