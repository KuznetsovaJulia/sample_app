Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get '/home' => 'static_pages#home', as: 'helf'
  get '/help'=> 'static_pages#help', as: :help
  get '/about' => 'static_pages#about', as: :about
  get '/contact' => 'static_pages#contact', as: :contact
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :users
  resources :account_activations, only: [:edit]
end
