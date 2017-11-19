Rails.application.routes.draw do
  root 'game#create'
  post '/', to: 'game#play'
end
