Myapp::Application.routes.draw do

  
  mount ForestLiana::Engine => '/forest'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :events
  resources :calendar, only: :show
  resources :ical, only: :show
  resources :peoples, only: [:index, :edit, :update]
  resources :startups

  root to: 'home#index'
  
  require 'sidekiq/web'
  authenticate :user, lambda { |u| u.is_admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  
  get "/404", to: "errors#not_found"
  get "/500", to: "errors#internal_error"
end
