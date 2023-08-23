Rails.application.routes.draw do
  resources :defense_processes
    root 'welcome#index'
    devise_for :users, path: 'users'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    get 'board/index'

    get 'locale/:lang', action: :switch_locale, controller: 'application', as: 'locale'

end
