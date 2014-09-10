Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "home#index"

  resources :users, except: [:new, :create, :destroy]

  resources :paths do
    resources :comments
    resources :votes
    resources :steps
  end

  resources :assets, except: [:new] do
    resources :comments
    resources :votes
  end

  resources :tags, only: [:create, :new]
end
