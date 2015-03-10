Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
  namespace :api do
    resources :photos, only: [:create, :destroy, :edit, :show, :index]
  end
end
