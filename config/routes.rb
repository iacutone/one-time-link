OneTimeLink::Application.routes.draw do
  devise_for :users
  resources :users
  
  root 'users#file_upload'
  
  namespace :users do
    # root :to => "index#index"
  end
end
