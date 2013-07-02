RuntalkChat::Application.routes.draw do
  root 'chats#index'
  
  resources :chats do 
    resources :messages
    resources :locations, only: [:new, :create]
    resource :invitations, only: [:new, :create ]
    resources :photos, only: [:create]
  end

  resource :users


  resource :sessions, only: [:new, :create]
  get '/logout' => 'sessions#destroy', as: 'logout'
  get '/login' => 'sessions#new', as: 'login'
  get '/search' => 'chats#search', as: 'search'

end
