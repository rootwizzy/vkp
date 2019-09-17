Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "dashboard#index"
  
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'login', to: redirect('https://discordapp.com/api/oauth2/authorize?client_id=623342812502425611&redirect_uri=https://villain-dkp.herokuapp.com/auth/discord&response_type=code&scope=identify'), as: 'login'
end
