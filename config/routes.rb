Rails.application.routes.draw do

  root to: 'static#root'

  resources :static, only: [] do
    post :search, on: :collection
  end

end
