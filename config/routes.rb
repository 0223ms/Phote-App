Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :user do
    get 'edit_password', to: 'users/registrations#edit_password'
    post 'update_password', to: 'users/registrations#update_password'
  end

  root to: "posts#index"

  resources :follows, only: [:create, :destroy] do
    collection do
      post :top_create
      post :top_destroy
    end
  end
  resources :rooms, only: [:index, :new, :create] do
    get :search, on: :collection
  end
  resources :messages, only: [:show]
  resources :exhibitions, only: [:show] do
    member do
      get :save_post
      get :tag_post
    end
  end
  resources :messages, only: [:index, :show]
  resources :posts, only: [:index, :new, :create, :show ,:edit, :update, :destroy]
  resources :tags, only: [:new]
  mount ActionCable.server => '/cable'
end
