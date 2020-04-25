Rails.application.routes.draw do
  # devise_for :users
  resources :users
  get 'sessions/login'
  get 'sessions/login_attempt'
  post "/sessions/login_attempt", to: "sessions#login_attempt" 
  get 'sessions/home'
  get 'sessions/profile'
  get 'sessions/setting'

  # devise_for :users, :controllers => { registrations: 'registrations'}


  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
