Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users, path: 'users'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get "board/index"
  # root "home#index"
end
