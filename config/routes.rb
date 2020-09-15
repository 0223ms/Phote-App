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
      post :users_create
    end
    member do
      delete :top_destroy
      delete :users_destroy
    end
  end
  resources :rooms, only: [:index, :new, :create, :destroy] do
    get :search, on: :collection
  end
  resources :messages, only: [:show]
  resources :exhibitions, only: [:show] do
    member do
      get :save_post
      get :tag_post
      get :post_show
    end
    resources :comments, only: [:create, :destroy] do
      get :show_create, on: :collection
    end
  end
  resources :messages, only: [:index, :show]

  resources :posts do
    post 'add' => 'likes#create'
    delete '/add' => 'likes#destroy'
    get :tag, param: :name
    resources :comments, only: [:create, :destroy] do
      get :show_create, on: :collection
    end
  end

  resources :tags, only: [:new, :index, :show]
  resources :peoples, only: [:index]
  get '/posts/tag/:name' => 'posts#tag'
  mount ActionCable.server => '/cable'
end
