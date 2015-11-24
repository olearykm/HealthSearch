class Doctor < ActiveRecord::Base
  has_many :assignments
  has_many :specialties
end
