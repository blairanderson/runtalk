RuntalkChat::Application.routes.draw do
  root 'chats#index'
  
  resources :chats do 
    resources :messages
    resources :locations, only: [:new, :create]
    resource :invitations, only: [:new, :create ]
    resources :photos, only: [:create]
    get '/name' => 'users#name', as: 'name'
  end

  resource :users
  resources :profiles, only: [:new, :create]

<<<<<<< HEAD
  resource :sessions
=======
  resource :sessions, only: [:new, :create]
  get '/logout' => 'sessions#destroy', as: 'logout'
  get '/login' => 'sessions#new', as: 'login'
>>>>>>> eee447844210d68ff7f861208fd17f5cff4aa30a
  get '/search' => 'chats#search', as: 'search'

end
