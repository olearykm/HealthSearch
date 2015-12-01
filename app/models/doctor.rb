class Doctor < ActiveRecord::Base
  has_many :assignments
  has_many :offices, through: :assignments
  has_many :specialties
  has_many :fields, through: :specialties

  def full_name
    "Dr. #{self.first_name} #{self.last_name}"
  end

  def expertise
    self.fields.map { |field| field.subject }.sort.join(", ")
  end

  def is_a?(specialty)
    boolean = false
    self.fields.each { |field| boolean = true if field.subject == specialty }
    return boolean
  end

end
