Rails.application.routes.draw do
  root 'game#new'
  post '/', to: 'game#play'
end
