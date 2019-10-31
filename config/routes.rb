Rails.application.routes.draw do
  #root 'importers#index'
  root 'sites#index'

  resources :importers
  resources :sites
  resources :keywords
  resources :rankings do
    collection do
      get :export_csv
    end
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
