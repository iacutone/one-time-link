OneTimeLink::Application.routes.draw do

  devise_for :users
  resources :users
  resources :links
  
  root 'users#file_upload'
  
  # namespace :users do
  #   get 'file_upload', to: 'users#file_upload'
  # end
end
