Rails.application.routes.draw do
  get 'lessons/index'
  get 'lessons/show'
  get 'lessons/new'
  get 'lessons/create'
  get 'lessons/destroy'
  # get 'courses/index'
  # get 'courses/:id', to: 'courses#show', as: :course
  resources :courses do
    resources :lessons, only: [ :index, :show, :new, :create, :edit, :update ]    
    resources :enrollments, only: [ :index ] do 
      collection { post :import }
    end
  end

  resources :schools, only: [] do
    resources :faculties, only: :index
  end

  resources :semesters, only: [ :new, :create, :edit, :update]

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
  get 'pages/dashboard', to: 'pages#dashboard'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
