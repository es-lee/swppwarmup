Rails.application.routes.draw do
  root 'usr#main'
  post 'signup' => 'usr#signup'
  post 'login' => 'usr#login'
end
