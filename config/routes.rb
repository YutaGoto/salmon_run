Rails.application.routes.draw do
  resources :events, only: %i[index show]

  namespace :api do
    resources :events, only: %i[index show] do
      collection do
        get :open
      end
    end
    resources :weapons, only: [:index]
    resources :stages, only: [:index]
  end

  get '*path' => 'application#render_404'
end
