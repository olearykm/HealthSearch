class Office < ActiveRecord::Base
  has_many :assignments
  has_many :doctors, through: :assignments
  has_many :fields, through: :doctors

  def is_office_in_state?(current_state)
    self.state == current_state
  end

  def is_office_in_city_and_state?(current_city, current_state)
    self.city == current_city && self.state == current_state
  end

  def self.find_offices_by_state(current_state)
    Office.where(state: current_state)
  end

  def self.find_offices_by_city_state(current_city, current_state)
    Office.where(city: current_city, state: current_state)
  end

  def self.find_offices_by_state_field(current_state, current_field)
    Office.joins(:fields).where(offices: { state: current_state }, fields: { subject: current_field }).distinct
  end

  def self.find_offices_by_city_state_field(current_city, current_state, current_field)
    Office.joins(:fields).where(offices: { city: current_city, state: current_state }, fields: { subject: current_field }).distinct
  end

end
