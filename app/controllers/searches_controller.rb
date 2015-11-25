class SearchesController < ActionController::Base

  def index
    @states = {
      CA: "California",
      GA: "Georgia",
      IL: "Illinois",
      MN: "Minnesota"
    }
  end

  def state
    @current_state = params[:state]
    @offices = Office.where(state: @current_state)
    @fields = Field.all
  end

  def search
    @doctors = []
    @offices = Office.where(office_params)
    @current_offices = []

    if search_by_city_state_field?
      potential_doctors = @offices.map { |office| office.doctors }.flatten
      potential_doctors.each do |doctor|
        if doctor.fields.find_by(subject: field_params) && !@doctors.include?(doctor)
          @doctors << doctor
          @current_offices << doctor.offices.find_by(office_params)
        end
      end
      render :state_field

    elsif search_by_state_field?
      potential_doctors = @offices.map { |office| office.doctors }.flatten
      potential_doctors.each do |doctor|
        if doctor.fields.find_by(subject: field_params) && !@doctors.include?(doctor)
          @doctors << doctor
          @current_offices << doctor.offices.find_by(office_params)
        end
      end
      render :state_field

    elsif search_by_state_only? || search_by_city_state?
      @doctors = @offices.map { |office| office.doctors }.flatten
    end
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

  def search_by_city_state?
    office_params[:city] && !field_params
  end

  def search_by_state_field?
    !office_params[:city] && field_params
  end

  def search_by_state_only?
    !office_params[:city] && !field_params
  end

  def search_by_city_state_field?
    office_params[:city] && field_params
  end

end
