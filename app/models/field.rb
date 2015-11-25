class Field < ActiveRecord::Base
  has_many :specialties
  has_many :doctors, through: :specialties
  has_many :offices, through: :doctors
end
