Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
  end

  get 'search', to: "search#search"
  post 'search', to: "search#create"
end
