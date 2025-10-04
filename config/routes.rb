Rails.application.routes.draw do
  root "batches#index"
  
  resources :batches do
    resources :interviews, except: [:destroy] do
      resources :answers, only: [:create, :update]
    end
  end
  
  resources :materials
  resources :questions
  resources :interviewees
  resources :users, only: [:index, :show, :new, :create, :edit, :update]

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
