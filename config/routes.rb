Rails.application.routes.draw do
  get 'answers/create'
   devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords:'users/passwords'
  }
  
  resources :questions do
    collection do
      get "mypost"
    end
  end
  
  resources :questions do
    resources :answers, only: [:create] # /questions/1/answers/2
    collection do
      get "mypost"
    end
  end
  
  resources :memos
  root "memos#index"
end