RuntalkChat::Application.routes.draw do
  get "locations/create"
  root 'chats#index'
  resources :chats do
    resources :messages
    resources :locations, only: [:new, :create]
  end
end
