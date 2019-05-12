Rails.application.routes.draw do
  root 'daily_exchange_rates#index'
  resources :daily_exchange_rates
  get 'download', to: "daily_exchange_rates#download"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
