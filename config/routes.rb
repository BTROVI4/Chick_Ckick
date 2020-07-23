Rails.application.routes.draw do
  
  get 'welcome/index'

  resources :cities, shallow: true do
    resources :companies, shallow: true do
      resources :services, shallow: true do
        resources :specialists, shallow: true do  
          resources :datas
        end
      end
    end
  end
  
  
 
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
