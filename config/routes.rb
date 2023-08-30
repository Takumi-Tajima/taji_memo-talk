Rails.application.routes.draw do
   devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords:'users/passwords'
  }
  
  resources :memos
  root "memos#index"
end