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

  get 'group/:id/course/:course_id', to: 'groups#detailgrade', as: 'detailgrade_group'
  get 'group/:id/course/:course_id/grade', to: 'groups#detailgrade_course', as: 'detailgrade_course'
  post 'group/:id/course/:course_id/save', to: 'groups#detailgrade_save', as: 'detailgrade_save'
  get 'group/:id/course/:course_id/blank', to: 'groups#blank_course', as: 'blank_course'


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
