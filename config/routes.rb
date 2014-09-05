Rails.application.routes.draw do
  mount JasmineRails::Engine => '/specs' if defined?(JasmineRails)
  devise_for :users
  root to: "home#index"

  resources :paths do
    resources :comments
    resources :votes
    resources :steps
  end

  resources :assets do
    resources :comments
    resources :votes
  end

  resources :tags, only: [:create, :new]
end
