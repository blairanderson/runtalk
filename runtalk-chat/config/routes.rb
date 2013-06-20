RuntalkChat::Application.routes.draw do
  get "photos/new"
  get "photos/create"
  get "locations/create"
  root 'chats#index'
  resources :chats do
    resources :messages
    resources :locations, only: [:new, :create]
    resources :photos, only: [:create]
  end
end
