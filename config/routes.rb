Rails.application.routes.draw do
  root "static_pages#show", page: "home"
  get "/:page" => "static_pages#show"
  get "user/show"

  devise_for :users, controllers:{
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :users
  namespace :admin do
    resources :users
    resources :subjects
    resources :questions
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
