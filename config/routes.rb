Rails.application.routes.draw do
  devise_for :accounts, controllers: { omniauth_callbacks: 'accounts/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/dashboard" => "accounts#index"
  get "profile/:username" => "accounts#profile", as: :profile
  get "post/like/:post_id" => "likes#save_like", as: :like_post
  post "follow/accounts" => "accounts#follow_account", as: :follow_account

  resources :posts, only: [:new, :create, :show]
  resources :comments, only: [:create, :destroy]
  
  root to:"public#homepage"
end