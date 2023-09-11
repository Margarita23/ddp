Rails.application.routes.draw do
  resources :diplomas
  resources :commissions
  resources :teachers

  resources :defense_processes do
    resources :groups
  end

  resources :students
  
  root 'welcome#index'
  devise_for :users, path: 'users'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'board/index'

  get 'locale/:lang', action: :switch_locale, controller: 'application', as: 'locale'

  resources :protocols, only: [:show]

  get "create_pdf_protocol", action: :create_pdf, controller: 'students'

end
