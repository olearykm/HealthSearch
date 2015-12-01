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

  def phone_number
    "(#{self.phone[0..2]}) #{self.phone[3..5]}-#{self.phone[6..9]}"
  end

  def self.find_offices(zipcode, mileage)
    all_offices = Office.near(zipcode, mileage)
  end

  def rounded_distance
    '%.1f' % self.distance
  end

  def has_a?(specialty)
    boolean = false
    self.fields.each { |field| boolean = true if field.subject == specialty }
    return boolean
  end

end
