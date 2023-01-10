Rails.application.routes.draw do  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        sessions: 'api/v1/overrides/sessions',
        registrations: 'api/v1/overrides/registrations'
      }
    end
  end
  resources :companies, except: %i[new edit] do
    resources :followings, except: %i[new edit]
  end
  # POST /companies/:company_id/critics
  # POST /games/:game_id/critics
  resources :jobs, except: %i[new edit] do
    resources :followings, except: %i[new edit]
  end
end
