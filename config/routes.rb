Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :user do
    get 'edit_password', to: 'users/registrations#edit_password'
    post 'update_password', to: 'users/registrations#update_password'
  end

  root "tops#index"

  resources :follows, only: [:create, :destroy]
  resources :messages, only: [:index, :show]
  resources :exhibitions, only: [:show] do
    member do
      get :save_post
      get :tag_post
    end
  end


  root "tops#index"

  resources :messages, only: [:index, :show]

  resources :posts, only: [:new]
  resources :tags, only: [:new]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
