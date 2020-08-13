Rails.application.routes.draw do
  
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'welcome/index'

  resources :users

  resources :cities do
    resources :companies do
      resources :services do
        resources :specialists do  
          resources :appointments
        end
      end
    end
  end

  namespace :api do
    resources :cities do
      resources :companies do
        resources :services do
          resources :specialists do 
            resources :appointments
          end
        end
      end
    end
  end
  
  
 
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
