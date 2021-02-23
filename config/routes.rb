Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users
  resources :books do
    resource :favorites, only: [:create, :destroy]
  end

  get 'search', to: "search#search"
  post 'search', to: "search#create"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
