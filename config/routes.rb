Rails.application.routes.draw do
  root to: 'static_pages#root'

  get '/welcome' => 'sessions#new', as: 'welcome'

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    get '/photos/liked', to:'photos#liked'
    get '/photos/followed', to:'photos#followed'
    resources :photos, only: [:create, :destroy, :update, :show, :index]
    resources :albums, only: [:create, :destroy, :update, :show, :index]
    resources :comments, only: [:create, :destroy, :update]
    post '/likes', to: 'likes#toggle'
    get '/users/following', to: 'users#following'
    get '/users/followers', to: 'users#followers'
    get '/users/search', to: 'users#search'
    get '/users/:id', to: 'users#show'
    resources :follows, only: [:create, :destroy]
    get 'tags/:id', to: 'photos#by_tag'
  end

  get "/auth/:provider/callback", to: "sessions#omniauth"

end
