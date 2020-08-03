Rails.application.routes.draw do
  
  get 'welcome/index'

  resources :cities do
    resources :companies do
      resources :services do
        resources :specialists do  
          resources :whours
        end
      end
    end
  end

  namespace :api do
    resources :cities do
      resources :companies do
        resources :services do
          resources :specialists do 
            member do
              post :book_appointment
            end
            resources :whours
          end
        end
      end
    end
  end
  
  
 
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
