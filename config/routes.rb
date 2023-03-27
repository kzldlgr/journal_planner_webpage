Rails.application.routes.draw do
  resources :categories do
    resources :tasks 
    end

  root 'home#index'
  get 'home/alltask'
  devise_for :users
  # get '/categories' => 'categories#index'
  # get '/categories/new' => 'categories#new', as: 'new_category'
  # post '/categories' => 'categories#create', as: 'create_category'
  # get '/categories/:id' => 'categories#show', as: 'category'
  # get '/categories/:id/edit' => 'categories#edit', as: 'edit_category'
  # patch '/categories/:id' => 'categories#update'
  # delete '/categories/:id' => 'categories#destroy', as: 'delete_category'
  # get '/tasks' => 'tasks#index'
  # get '/tasks/new' => 'tasks#new', as: 'new_task'
  # post '/tasks' => 'tasks#create', as: 'create_task'
  # get '/tasks/:id' => 'tasks#show', as: 'task'
  # get '/tasks/:id/edit' => 'tasks#edit', as: 'edit_task'
  # patch '/tasks/:id' => 'tasks#update'
  # delete '/tasks/:id' => 'tasks#destroy', as: 'delete_task'

end
