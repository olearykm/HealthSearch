class Doctor < ActiveRecord::Base
  has_many :assignments
  has_many :offices, through: :assignments
  has_many :specialties
  has_many :fields, through: :specialties

  def expertise
    self.fields.map { |field| field.subject }.sort
  end
end
