Rails.application.routes.draw do

  root 'activity#index'

  devise_for :teachers

  get '/teachers', to: 'teachers#index'
  delete '/teachers/student/:id', to: 'teachers#destroy_student'

  resources :students
end
