Rails.application.routes.draw do
  
  resources :tidbits, only: [:index, :create]
  

end
