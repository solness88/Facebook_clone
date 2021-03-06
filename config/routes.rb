Rails.application.routes.draw do
  resources :relationships, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index]
  resources :blogs do
    resources :comments
    collection do
      post :confirm
    end
    member do
      get :index_user
    end
  end
end
