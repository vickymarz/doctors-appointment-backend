# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Doctor.create!(name: 'Dr Mercy', description: 'Hello there, nice to meet you', specialization: 'Ophthalmologist', charges: 100, photo: 'https://images.pexels.com/photos/5452201/pexels-photo-5452201.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')
Doctor.create!(name: 'Dr Kayline', description: 'Hello there, nice to meet you', specialization: 'Surgeon', charges: 100, photo: 'https://images.pexels.com/photos/6129507/pexels-photo-6129507.jpeg?auto=compress&cs=tinysrgb&w=800')
Doctor.create!(name: 'Dr Jess', description: 'Hello there, nice to meet you', specialization: 'Biologist', charges: 100, photo: 'https://images.pexels.com/photos/4173251/pexels-photo-4173251.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')
Doctor.create!(name: 'Dr Rose', description: 'Hello there, nice to meet you', specialization: 'Dentist', charges: 100, photo: 'https://images.pexels.com/photos/5452293/pexels-photo-5452293.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')
Doctor.create!(name: 'Dr Fabian', description: 'Hello there, nice to meet you', specialization: 'Therapy', charges: 100, photo: 'https://images.pexels.com/photos/5407206/pexels-photo-5407206.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2')