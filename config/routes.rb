Rails.application.routes.draw do
  root 'pages#home'
  
  get 'home', to: 'pages#home'
  get 'about', to: 'pages#about'
  
  devise_for :users
  
  resources :pigeons do
    resources :shared_pigeons
  end
  get '/:token', to: 'pigeon_messages#pigeon_message'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
