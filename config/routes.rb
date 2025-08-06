Rails.application.routes.draw do
  resources :locations
  resources :packages
  resources :fleets
  namespace :apps do
    get "assets_management/devices"
    get "assets_management/devices_mobile"
    get "assets_management/device"
    get "assets_management/device_mobile"
    get "assets_management/dispatcher"
    get "assets_management/driver"
    get "assets_management/driver_mobile"
    get "assets_management/dispatcher_mobile"
    get "assets_management/ride"
    get "assets_management/ride_mobile"
    get "assets_management/client"
    get "assets_management/client_mobile"
    get "assets_management/dashboarsd"
    get "assets_management/dashboard_mobile"
    get "delivery/dispatcher"
    get "delivery/driver"
    get "delivery/driver_mobile"
    get "delivery/dispatcher_mobile"
    get "delivery/ride"
    get "delivery/ride_mobile"
    get "delivery/client"
    get "delivery/client_mobile"
    get "delivery/dashboarsd"
    get "delivery/dashboard_mobile"
    get "taxi/dispatcher"
    get "taxi/driver"
    get "taxi/driver_mobile"
    get "taxi/dispatcher_mobile"
    get "taxi/ride"
    get "taxi/ride_mobile"
    get "taxi/client"
    get "taxi/client_mobile"
  end
  resources :device_kinds
  resources :passengers
  resources :activities
  resources :rides
  get "c2_app/dispatcher"
  get "c2_app/driver"
  get "c2_app/customer"
  get "c2_app/commander"
  get "delivery_app/dispatcher"
  get "delivery_app/driver"
  get "delivery_app/customer"
  get "taxi_app/dispatcher"
  get "taxi_app/driver"
  get "taxi_app/ride"
  get "taxi_app/customer"
  resources :devices

  get "home/index"
  get "home/map"
  get "home/units"
  get "home/devices"
  get "home/device"
  get "home/tickets"
  get "home/ticket"
  get "home/ticket_mobile"
  get "home/rides"
  get "home/ride"
  get "home/ride_mobile"
  get "home/drivers"
  get "home/driver"
  get "home/driver_mobile"
  get "home/activities"
  get "home/set_theme"
  get "home/set_language"
  get "home/dashboard"
  get "home/delivery_dispatcher"
  get "home/taxi_dispatcher"
  get "home/taxi_driver"
  get "home/commander"
  get "home/drivers"
  get "home/driver"
  get "home/soldier"
  get "home/delivery_driver"
  get "home/messages"
  devise_for :users
  resources :users
  resources :messages
  resources :tickets

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "home#index"
end
