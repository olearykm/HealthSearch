Rails.application.routes.draw do

  root "searches#home"
  get "/:state" => "searches#search"
  get "/:state/results" => "searches#results"
  get "/:state/offices/:office_id/doctors/:id" => "searches#show_doctor"
  get "/:state/offices/:id" => "searches#show_office"

end
