RuntalkChat::Application.routes.draw do
  root 'chats#index'
  
  resources :chats do 
    resources :messages
    resources :locations, only: [:new, :create]
    resource :invitations, only: [:new, :create ]
  end

  resource :users


  resource :sessions, only: [:new, :create]

end
