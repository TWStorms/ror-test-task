Rails.application.routes.draw do
  get 'student_schedules/student_subjectsindex'
  get 'schedules/index'
  get 'students/studentsindex'
  resources :teachers do
    resources :teacher_subjects, shallow: true
  end

  resources :students do
      resources :student_schedules, shallow: true
  end

  resources :schedules
  resources :subjects
  root to: 'subjects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
