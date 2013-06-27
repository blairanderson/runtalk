RuntalkMessages::Application.routes.draw do
  resources :messages, only: [:index]
end
