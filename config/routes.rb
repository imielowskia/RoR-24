Rails.application.routes.draw do
  resources :fields
  resources :grades
  resources :courses
  resources :students
  resources :groups
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'course/:id/group/:group_id', to: 'courses#grade', as: 'grade_course'
  get 'course/:id/group/:group_id/grade', to: 'courses#grade_group', as: 'grade_group'
  post 'course/:id/group/:group_id/save', to: 'courses#grade_save', as: 'grade_save'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
