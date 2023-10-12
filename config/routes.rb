Rails.application.routes.draw do
  resources :ratings
  resources :eval_methods
  resources :questions
  resources :commissions
  resources :teachers
  resources :marks

  resources :defense_processes do
    resources :groups
  end

  resources :students
  
  root 'welcome#index'
  devise_for :users, path: 'users'

  get 'board/index'

  get 'locale/:lang', action: :switch_locale, controller: 'application', as: 'locale'

  resources :protocols, only: [:show]

  get 'create_pdf_protocol', action: :create_pdf, controller: 'students'

end
