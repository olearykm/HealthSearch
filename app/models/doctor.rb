class Doctor < ActiveRecord::Base
  has_many :assignments
  has_many :offices, through: :assignments
  has_many :specialties
  has_many :fields, through: :specialties

  def full_name
    "Dr. #{self.first_name} #{self.last_name}"
  end

  def location(current_city)
    office = self.offices.find_by(city: current_city)
  end

  def self.find_doctors_by_state(current_state)
    Doctor.joins(:offices).where("offices.state = ?", current_state).distinct
  end

  def self.find_doctors_by_city_state(current_city, current_state)
    Doctor.joins(:offices).where("offices.city = ? and offices.state = ?", current_city, current_state)
  end

  def self.find_doctors_by_state_field(current_state, current_field)
    Doctor.joins(offices: :fields).where(offices: { state: current_state }, fields: { subject: current_field }).distinct
  end

  def self.find_doctors_by_city_state_field(current_city, current_state, current_field)
    Doctor.joins(offices: :fields).where(offices: { city: current_city, state: current_state }, fields: { subject: current_field }).distinct
  end

  def expertise
    self.fields.map { |field| field.subject }.sort
  end
end
