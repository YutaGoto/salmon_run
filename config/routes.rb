Rails.application.routes.draw do
  get 'welcome/index'
  resources :events

  namespace :api do
    resources :events
  end

  namespace :ajax do
    resources :events
  end
end
