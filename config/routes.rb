Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :rooms do
    resources :questions, shallow: true
    member do
      resources :answers, only: %i[ index new create ]
    end
  end
  resources :answers, except: %i[ index new create ]
  resources :question_answers
  resources :respondents
end
