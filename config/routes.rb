Rails.application.routes.draw do
  resources :instructor_profiles
  resources :groups
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }

  resources :courses do
    resources :groups
  end

  root 'courses#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
