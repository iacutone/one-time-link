OneTimeLink::Application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users
  resources :links
  
  root 'links#new'
end
