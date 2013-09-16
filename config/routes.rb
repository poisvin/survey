Survey::Application.routes.draw do
  get "sessions/new"

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  resources :users
  resources :sessions
  resources :enquetes do
    resources :responses
  end
  resources :answers
  resources :questions
  match 'verification/:email_token' => 'sessions#verification' 
  # resources :answers
  # root :to => "enquetes#index"
  root :to => "welcome#index"
end
