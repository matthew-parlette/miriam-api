Rails.application.routes.draw do
  resources :links
  resources :tasks
  resources :task_priorities
  resources :task_states
  resources :task_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
