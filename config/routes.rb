Rails.application.routes.draw do
  root 'users#new'
  resources :users do
    collection do
      post 'confirm'
    end
    member do
      get 'look_all'
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts do
    collection do
      post 'confirm'
    end
  end
  resources :likes, only: [:create, :destroy]
end