OneTimeLink::Application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users
  resources :links
  namespace :links do
    post :send_text_message
  end
  
  root 'links#new'
end
