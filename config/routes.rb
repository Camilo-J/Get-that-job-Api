Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :jobs, except: %i[new]
  # resources :followings, except: %i[index delete]

  resources :companies, except: %i[new edit] do
    resources :followings, except: %i[new edit]
  end
  # POST /companies/:company_id/critics
  # POST /games/:game_id/critics
  resources :jobs, except: %i[new edit] do
    resources :followings, except: %i[new edit]
  end
end
