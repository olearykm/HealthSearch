class SearchesController < ApplicationController

  def home
    @states = Office.all_states
  end

  def search
    @state = params[:state]
    @offices = Office.where(state: @state)
    @fields = Field.all

    @states = Office.all_states
  end

  def results
    search_type = params[:type]
    @state = params[:state]
    @field = params[:field]
    @mileage = params[:mileage]
    @zipcode = params[:zipcode]

    @offices = Office.find_offices(@zipcode, @mileage)

    if search_type == "Doctors"
      render :results_doctors
    elsif search_type == "Healthcare Centers"
      render :results_offices
    end
  end

  def show_doctor
    @office = Office.find(params[:office_id])
    @doctor = Doctor.find(params[:id])
  end

  def show_office
    @office = Office.find(params[:id])
  end

end
