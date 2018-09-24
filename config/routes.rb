Rails.application.routes.draw do
  resources :events

  namespace :api do
    resources :events
  end

  namespace :ajax do
    resources :events
  end
end
