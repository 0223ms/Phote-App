Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :user do
    get 'edit_password', to: 'users/registrations#edit_password'
    post 'update_password', to: 'users/registrations#update_password'
  end



  resources :follows, only: [:create, :destroy]
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
  mount ActionCable.server => '/cable'


  root to: "posts#index"

  resources :messages, only: [:index, :show]

  resources :posts, only: [:index, :new, :create, :show ,:edit, :update, :destroy]
  resources :tags, only: [:new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
