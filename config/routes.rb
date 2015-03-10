Rails.application.routes.draw do
  root to: 'static_pages#root'

  get '/welcome' => 'sessions#new', as: 'welcome'

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]

  namespace :api do
    resources :photos, only: [:create, :destroy, :edit, :show, :index]
    resources :albums, only: [:create, :destroy, :edit, :show, :index]
  end

end
