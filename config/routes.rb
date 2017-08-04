Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/tables/new" => "tables#new"
  post "/tables" => "tables#create"
  root 'tables#new'
end
