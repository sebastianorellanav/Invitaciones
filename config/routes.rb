Rails.application.routes.draw do
  resources :user_events
  resources :type_states
  resources :events
  resources :users
  post 'user_events/change_state', :to => 'user_events#change_state', :as => 'change_state'
  root "events#welcome"
end
