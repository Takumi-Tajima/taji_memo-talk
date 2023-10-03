Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    passwords: 'admins/passwords'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  resources :questions do
    resources :answers, only: %i[create]
    collection do
      get 'myquestions'
    end
  end

  resources :memos

  resources :rooms, only: %i[show] do
    resources :comments, only: %i[create]
  end

  resources :comments do
    resource :reactions, only: %i[create destroy]
  end

  root 'memos#index'

  namespace :admins do
    resources :rooms, only: %i[index new edit create update destroy]
    resources :users, only: %i[index edit update destroy]
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
