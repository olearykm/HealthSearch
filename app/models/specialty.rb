class Specialty < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :field
end
