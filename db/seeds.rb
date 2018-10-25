# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

5.times do
  city = City.create!(name: Faker::Address.city)
end

10.times do
  doctor = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name ,postal_code: Random.rand(01..99), city_id: Faker::Number.between(City.first.id, City.last.id))
end

7.times do
  speciality = Speciality.create!(name: Faker::Military.air_force_rank)
end

50.times do
  patient = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: Faker::Number.between(City.first.id, City.last.id))
end

100.times do
  appointment = Appointment.create!(date: Faker::Date.forward(30), doctor_id: Faker::Number.between(Doctor.first.id, Doctor.last.id), patient_id: Faker::Number.between(Patient.first.id, Patient.last.id), city_id: Faker::Number.between(City.first.id, City.last.id))
end

Doctor.all.each do |doctor|
  doctor.specialities.push(Speciality.all.sample)
  doctor.save
end

Speciality.all.each do |speciality|
  speciality.doctors.push(Doctor.all.sample)
  speciality.save
end
