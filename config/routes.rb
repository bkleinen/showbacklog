Showback::Application.routes.draw do
  get ':owner/:repository' => 'backlog#show'
end
