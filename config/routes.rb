Rails.application.routes.draw do
  get 'rooms/index'
  get 'rooms/show'
  get 'rooms/new'
  get 'rooms/edit'
  get 'rooms/create'
  get 'rooms/update'
  get 'rooms/destroy'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    passwords:'admins/passwords'
  }

   devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords:'users/passwords'
  }
  
  resources :questions do
    resources :answers, only: %i[create]
    collection do
      get "mypost"
    end
  end
  
  resources :memos
  root "memos#index"
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end