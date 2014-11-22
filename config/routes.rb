Bowling::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => 'users/omniauth_callbacks' }

  devise_scope :user do
    get 'login', :to => 'users/sessions#new', :as => :new_session
    get 'logout', :to => 'users/sessions#destroy', :as => :destroy_session
  end

  resources :leagues do
    get 'stats', on: :member
    get 'week/:week', on: :member, :action => 'week', :as => 'week'
  end

  resources :teams
  resources :bowlers
  resources :series do
    collection do
      get 'next_week'
    end
  end

  root :to => 'home#index'
end
