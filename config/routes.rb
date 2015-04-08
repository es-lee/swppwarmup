Rails.application.routes.draw do
  root 'usr#main'
  post 'signup' => 'usr#signup'
  post 'login' => 'usr#login'
  get 'welcome' => 'usr#welcome'
  post 'clearData' => 'usr#clear'
end
