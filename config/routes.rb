Rails.application.routes.draw do
  resources :alives, only: :show

  mount API => '/'
end
