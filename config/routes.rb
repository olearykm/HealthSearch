Rails.application.routes.draw do

  root "searches#home"
  get "/:state" => "searches#state"
  post "/:state/results" => "searches#search"

end
