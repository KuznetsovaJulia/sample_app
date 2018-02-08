Rails.application.routes.draw do
  get 'users/new'
  get '/home' => 'static_pages#home', as: 'helf'
  get '/help'=> 'static_pages#help', as: :help
  get '/about' => 'static_pages#about', as: :about
  get '/contact' => 'static_pages#contact', as: :contact
  root 'static_pages#home'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users
end
