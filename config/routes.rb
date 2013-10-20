Showback::Application.routes.draw do
  root 'backlog#index'
  get ':owner/:repository' => 'backlog#show'
end
