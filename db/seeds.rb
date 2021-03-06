# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  FactoryGirl.create :doctor
end

10.times do
  FactoryGirl.create :patient
end

Category.create!([
  {specialty: 'Orthopedist', ailment: 'Broken Bones'},
  {specialty: 'Cardiologist', ailment: 'Heart Disease'},
  {specialty: 'Opthamologist', ailment: 'Eye Trouble'}
  ])
