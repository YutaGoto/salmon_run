Rails.application.routes.draw do
  resources :events

  namespace :api do
    resources :events do
      collection do
        get :open
      end
    end
  end

  namespace :ajax do
    resources :events
  end
end
