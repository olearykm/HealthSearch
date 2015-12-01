class Office < ActiveRecord::Base
  attr_reader :all_states

  has_many :assignments
  has_many :doctors, through: :assignments
  has_many :fields, through: :doctors

  geocoded_by :full_address
  after_validation :geocode

  def self.all_states
    {
      CA: "California",
      GA: "Georgia",
      IL: "Illinois",
      MN: "Minnesota"
    }
  end

  def full_address
    "#{self.address} #{self.city}, #{self.state} #{self.zip}"
  end

  def self.find_offices(zipcode, field, mileage)
    all_offices = Office.near(zipcode, mileage)
  end

  # def is_office_in_state?(current_state)
  #   self.state == current_state
  # end
  #
  # def is_office_in_city_and_state?(current_city, current_state)
  #   self.city == current_city && self.state == current_state
  # end
  #
  # def self.find_offices_by_state(current_state)
  #   Office.where(state: current_state)
  # end
  #
  # def self.find_offices_by_city_state(current_city, current_state)
  #   Office.where(city: current_city, state: current_state)
  # end
  #
  # def self.find_offices_by_state_field(current_state, current_field)
  #   Office.joins(:fields).where(offices: { state: current_state }, fields: { subject: current_field }).distinct
  # end
  #
  # def self.find_offices_by_city_state_field(current_city, current_state, current_field)
  #   Office.joins(:fields).where(offices: { city: current_city, state: current_state }, fields: { subject: current_field }).distinct
  # end

end
