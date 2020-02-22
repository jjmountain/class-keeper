Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'lessons/index'
  get 'lessons/show'
  get 'lessons/new'
  get 'lessons/create'
  get 'lessons/destroy'
  # get 'courses/index'
  # get 'courses/:id', to: 'courses#show', as: :course
  resources :courses do
    get 'lessons/preview', to: 'lessons#preview'
    resources :lessons, only: [ :index, :show, :new, :create, :edit, :update ]    
    resources :enrollments, only: [ :index ] do 
      collection { post :import }
    end
  end

  resources :course_periods, only: [ :create, :update, :destroy ]

  resources :schools, only: [ :new, :create, :edit, :update] do
    resources :faculties, only: [ :index, :new, :edit, :create, :update ]
  end

  resources :faculties, only: [] do 
    resources :periods, only: [ :create, :update]
  end

  resources :periods, only: [ :destroy ]


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
end
