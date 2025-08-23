Rails.application.routes.draw do
  root "home#index"

  get "home/index"
  get "home/credits"

  resources :vehicles
  resources :transports
  resources :roads
  resources :places
  resources :structures
  resources :reasons
  resources :reimbursements do
    collection do
      get :print
      get :print_list
    end
  end
  resources :reimbursement_closures

  devise_for :users, skip: [:registrations]
  as :user do
    get "users/edit" => "devise/registrations#edit", :as => "edit_user_registration"
    put "users" => "devise/registrations#update", :as => "user_registration"
  end

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"

  get "up" => "rails/health#show", as: :rails_health_check

  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
