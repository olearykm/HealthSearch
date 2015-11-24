class Field < ActiveRecord::Base
  has_many :specialties
  has_many :doctors, through: :specialties
end
