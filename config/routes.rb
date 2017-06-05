Rails.application.routes.draw do
  resources :submitted_answers
  resources :answers
  resources :questions
  resources :categories
  root 'static_page#home'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
