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
    @offices = Office.where(office_params)

    @doctors = []
    @offices.each { |office| office.doctors.each { |doctor| @doctors << doctor } }
    @doctors = @doctors.keep_if { |doctor| doctor.fields.find_by(subject: field_params) } unless field_params.blank?


    # all_doctors = @offices.each { |office| office.doctors.each { |doctor| @doctors << doctor } }


    # @doctors = Doctor.includes(:offices).where("offices.state" => "MN")
  end

  private

  def office_params
    conditions = {}
    conditions[:state] = params[:office][:state]
    conditions[:city] = params[:office][:city] unless params[:office][:city].blank?
    return conditions
  end

  def field_params
    params[:field][:subject]
  end

  def doctor_params
  end

end
