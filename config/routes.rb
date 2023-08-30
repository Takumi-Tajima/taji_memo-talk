Rails.application.routes.draw do
    
  get 'questions/new'
  get 'questions/index'
  get 'questions/edit'
  get 'questions/show'
  post 'questions/create'
  patch 'questions/update'
  delete 'questions/destroy'
  get "questions/mypost"
 
  
   devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords:'users/passwords'
  }
  
#   resources :questions do
#     collection do
#       get "mypost", to: "questions#mypost"
#     end
#   end

# indexを入力するとshowのビューが表示される
  
  resources :memos
  root "memos#index"
end