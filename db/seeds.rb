# Doctors
  100.times do
    Doctor.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
  end

# Offices
  states = ["CA", "GA", "IL"]

  Office.create(address: "514 14th Ave SE", city: "Minneapolis", state: "MN", zip: "55414", phone: Faker::Number.number(10))

  Office.create(address: "9900 Bren Rd E", city: "Minnetonka", state: "MN", zip: "55343", phone: Faker::Number.number(10))

  Office.create(address: "522 E Hennepin Ave", city: "Minneapolis", state: "MN", zip: "55414", phone: Faker::Number.number(10))

  Office.create(address: "907 N Washington Ave", city: "Minneapolis", state: "MN", zip: "55401", phone: Faker::Number.number(10))

  Office.create(address: "2451 Nicollet Ave S", city: "Minneapolis", state: "MN", zip: "55404", phone: Faker::Number.number(10))

  Office.create(address: "945 Broadway St NE", city: "Minneapolis", state: "MN", zip: "55413", phone: Faker::Number.number(10))

  Office.create(address: "600 E Hennepin Ave", city: "Minneapolis", state: "MN", zip: "55414", phone: Faker::Number.number(10))

  Office.create(address: "777 Grand Ave", city: "St Paul", state: "MN", zip: "55105", phone: Faker::Number.number(10))

  Office.create(address: "1750 Hennepin Ave", city: "Minneapolis", state: "MN", zip: "55403", phone: Faker::Number.number(10))

  Office.create(address: "2400 3rd Ave S", city: "Minneapolis", state: "MN", zip: "55404", phone: Faker::Number.number(10))

  Office.create(address: "2600 Park Ave S", city: "Minneapolis", state: "MN", zip: "55407", phone: Faker::Number.number(10))

  Office.create(address: "345 W Kellogg Blvd", city: "St Paul", state: "MN", zip: "55102", phone: Faker::Number.number(10))

  Office.create(address: "120 W Kellogg Blvd", city: "St Paul", state: "MN", zip: "55102", phone: Faker::Number.number(10))

  Office.create(address: "2115 Summit Ave", city: "St Paul", state: "MN", zip: "55105", phone: Faker::Number.number(10))

  Office.create(address: "201 SE Main St", city: "Minneapolis", state: "MN", zip: "55414", phone: Faker::Number.number(10))

  35.times do
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
