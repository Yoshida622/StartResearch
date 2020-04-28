Rails.application.routes.draw do
  get 'applications/index'
  post '/applications', to: 'applications#create'
  delete '/applications', to: 'applications#destroy'
  get 'keeps/index'
  post '/keeps', to: 'keeps#create'
  delete '/keeps', to: 'keeps#destroy'
  devise_for :users
  root 'pages#index'
  get 'posts/index'
  resources :posts, only: [:new, :show, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
