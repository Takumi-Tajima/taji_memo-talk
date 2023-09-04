Rails.application.routes.draw do
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