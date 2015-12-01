Rails.application.routes.draw do

  root "searches#home"
  get "/:state" => "searches#search"
  get "/:state/results" => "searches#results"

end
