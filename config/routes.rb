Rails.application.routes.draw do
  
  devise_for :users
  resources :questions
  resources :quizzes

  root 'pages#home', as: 'home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
