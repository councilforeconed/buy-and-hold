Rails.application.routes.draw do

  root 'activity#index'

  devise_for :teachers

  get '/teachers', to: 'teachers#index'
  delete '/teachers/student/:id', to: 'teachers#destroy_student'

  post '/teachers/set-year', to: 'teachers#set_year'
  post '/students/investments', to: 'students#make_investment'
  delete '/students/investments', to: 'students#destroy_investment'

  resources :students
end
