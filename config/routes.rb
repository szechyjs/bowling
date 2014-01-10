Bowling::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  devise_scope :user do
    get 'login', :to => 'users/sessions#new', :as => :new_user_session
    get 'logout', :to => 'users/sessions#destroy', :as => :destroy_user_session
  end

  resources :leagues
  resources :teams
  resources :bowlers

  root :to => "home#index"
end
