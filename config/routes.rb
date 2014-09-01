OneTimeLink::Application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users
  resources :links
  namespace :links do
    post :send_text_message
  end
  
  get '/about' => 'links#about'
  root 'links#new'
end
