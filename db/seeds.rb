# Doctors
  100.times do
    Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  end

# Offices
  states = ["CA", "GA", "IL", "MN"]

  50.times do
    Office.create(address: Faker::Address.street_address, city: Faker::Address.city, state: states.sample, zip: Faker::Address.zip_code, phone: Faker::Number.number(10))
  end

# Fields
  subjects = ["Anesthesiology", "Cancer", "Cardiovascular", "Dermatology", "Gastroenterology", "Gynecology", "Hematology", "Neonatal", "Ophthalmology", "Orthopedic", "Pediatric", "Psychiatry", "Radiology", "Urology"]

  subjects.each do |subject|
    Field.create(subject: subject)
  end

# Assignments
  Doctor.all.each do |doctor|
    office_ids = (1..50).to_a.sample(rand(3)+1)

    office_ids.each do |office_id|
      Assignment.create(doctor_id: doctor.id, office_id: office_id)
    end
  end

# Specialties
  Doctor.all.each do |doctor|
    field_ids = (1..subjects.count).to_a.sample(rand(4)+1)

    field_ids.each do |field_id|
      Specialty.create(doctor_id: doctor.id, field_id: field_id)
    end
  end
