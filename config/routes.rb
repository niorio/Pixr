Rails.application.routes.draw do
  root to: 'static_pages#root'

  get '/welcome' => 'sessions#new', as: 'welcome'

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :photos, only: [:create, :destroy, :update, :show, :index]
    resources :albums, only: [:create, :destroy, :update, :show, :index]
    resources :comments, only: [:create, :destroy, :update]
  end

  resources :photos, only: [:new]

end
