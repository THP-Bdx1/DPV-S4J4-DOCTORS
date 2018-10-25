# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

5.times do
    city = City.create!(name: Faker::Pokemon.location)
end

30.times do
    doctor = Doctor.create!(f_name: Faker::Beer.name, l_name: Faker::Beer.hop, city_id: Random.rand(1..5))
end

100.times do
    patient = Patient.create!(f_name: Faker::Pokemon.name, l_name: Faker::Dessert.variety, city_id: Random.rand(1..5))
end

30.times do
    specialty = Specialty.create!(name: Faker::Pokemon.move)
end

90.times do
    Doctor.find(Random.rand(1..30)).specialties << Specialty.find(Random.rand(1..30))
end

50.times do
    loop do
        doctor1 = Doctor.find(Random.rand(1..30))
        patient1= Patient.find(Random.rand(1..30))
        if doctor1.city_id == patient1.city_id
        appointment = Appointment.create!(doctor_id: doctor1.id, patient_id: patient1.id, city_id: patient1.city_id)
        break
        end
    end
end