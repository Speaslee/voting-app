Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions'}
  as :user do
    get 'users/sign_in' => 'users/sessions#new', :as => :new_user_session
    post 'users/sign_in' => 'users/sessions#create', :as => :session
    get 'users/sign_out' => 'users/sessions#destroy', :as => :destroy_user_session
  end

  get "up" => "rails/health#show", as: :rails_health_check
  resources :votes, only: [:new, :create, :show, :index]
  resources :candidates, only: :create
  # Defines the root path route ("/")
  root "votes#index"
end
