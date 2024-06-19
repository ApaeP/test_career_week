Rails.application.routes.draw do
  resources :missions
  resources :listings, only: %i[index show create update destroy]
end
