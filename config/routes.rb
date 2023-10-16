Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
  
  
  
  get 'users/new'
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  
  get 'books/new'
  get 'books/index'
  get 'books/show'
  get 'books/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
