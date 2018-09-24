Rails.application.routes.draw do
  resources :events, only: [:index]

  namespace :api do
    resources :events, only: [:index] do
      collection do
        get :open
      end
    end
  end

  namespace :ajax do
    resources :events, only: [:index]
  end
end
