Rails.application.routes.draw do
  get 'courses/index'
  get 'courses/:id', to: 'courses#show', as: :course

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  devise_for :students, controllers: { 
    sessions: 'students/sessions',
    registrations: 'students/registrations' 
  }

  root to: 'pages#home'

  get 'pages/login', to: 'pages#login'
  get 'pages/signup', to: 'pages#signup'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
