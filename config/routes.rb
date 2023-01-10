Rails.application.routes.draw do  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'user', controllers: {
        sessions: 'api/v1/overrides_user/sessions',
        registrations: 'api/v1/overrides_user/registrations'
      }

      mount_devise_token_auth_for 'Company', at: 'company', controllers: {
        sessions: 'api/v1/overrides_company/sessions',
        registrations: 'api/v1/overrides_company/registrations'
      }

      resources :companies, except: %i[new edit] do
        resources :followings, except: %i[new edit]
      end
      # POST /companies/:company_id/followings
      # POST /jobs/:job_id/followings
      resources :jobs, except: %i[new edit] do
        resources :followings, except: %i[new edit]
      end

      resources :applications_jobs
    end
  end
end
