class SearchesController < ActionController::Base

  def home
    @states = {
      CA: "California",
      GA: "Georgia",
      IL: "Illinois",
      MN: "Minnesota"
    }
  end

  def state
    @state = params[:state]
    @offices = Office.where(state: @state)
    @fields = Field.all

    @states = {
      CA: "California",
      GA: "Georgia",
      IL: "Illinois",
      MN: "Minnesota"
    }
  end

  def search
    # @city = office_params[:city]
    # @state = office_params[:state]
    # @field = field_params
    # @zipcode = search_in_zipcode

    @state = params[:state]
    @field = params[:field]
    @zipcode = params[:zipcode]

    @offices = Office.find_doctors(@zipcode, @field)
    render :main_search

    # if search_for_doctors?
    #
    #   case
    #   when search_by_state?
    #     # @offices = Office.near(@zipcode, 5).collect{ |office| office }.uniq
    #     # @doctors = Doctor.find_doctors_near_zipcode(@state, @offices)
    #     # @doctors.each { |doctor| p doctor }
    #     @doctors = Doctor.find_doctors_by_state(@state)
    #     render :doctors_by_state
    #   when search_by_city_state?
    #     @doctors = Doctor.find_doctors_by_city_state(@city, @state)
    #     render :doctors_by_city_state
    #   when search_by_state_field?
    #     @doctors = Doctor.find_doctors_by_state_field(@state, @field)
    #     render :doctors_by_state_field
    #   when search_by_city_state_field?
    #     @doctors = Doctor.find_doctors_by_city_state_field(@city, @state, @field)
    #     render :doctors_by_city_state_field
    #   end
    #
    # elsif search_for_centers?
    #
    #   case
    #   when search_by_state?
    #     @offices = Office.find_doctors(@zipcode, @field)
    #
    #     # @offices = Office.find_offices_by_state(@state)
    #     render :centers_by_state
    #   when search_by_city_state?
    #     @offices = Office.find_offices_by_city_state(@city, @state)
    #     render :centers_by_city_state
    #   when search_by_state_field?
    #     @offices = Office.find_offices_by_state_field(@state, @field)
    #     render :centers_by_state_field
    #   when search_by_city_state_field?
    #     @offices = Office.find_offices_by_city_state_field(@city, @state, @field)
    #     render :centers_by_city_state_field
    #   end
    #
    # end
  end

  private

  def office_params
    conditions = {}
    conditions[:state] = params[:office][:state]
    conditions[:city] = params[:office][:city] unless params[:office][:city].blank?
    return conditions
  end

  def field_params
    params[:field][:subject] unless params[:field][:subject].blank?
  end

  def search_for_doctors?
    params[:search][:type] == "Doctors"
  end

  def search_for_centers?
    params[:search][:type] == "Healthcare Centers"
  end

  def search_by_city_state?
    office_params[:city] && !field_params
  end

  def search_by_state_field?
    !office_params[:city] && field_params
  end

  def search_by_state?
    !office_params[:city] && !field_params
  end

  def search_by_city_state_field?
    office_params[:city] && field_params
  end

  def search_in_zipcode
    params[:search][:zipcode]
  end

end
