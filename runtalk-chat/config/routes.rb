RuntalkChat::Application.routes.draw do
  root 'chats#index'
  
  resources :chats, except: [:destroy, :edit, :update] do 
    resources :messages, only: [:create, :index]
    resources :locations, only: [:new, :create]
    resource :invitations, only: [:new, :create ]
    resources :photos, only: [:create]
    get '/name' => 'users#name', as: 'name'
  end

  resource :users
  resources :profiles, only: [:new, :create]

  resource :sessions, only: [:new, :create]
  get '/logout' => 'sessions#destroy', as: 'logout'
  get '/login' => 'sessions#new', as: 'login'
  get '/search' => 'chats#search', as: 'search'

end
