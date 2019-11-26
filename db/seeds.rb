# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'Destroying users'

User.destroy_all

puts 'Creating User...'

teacher = User.new(
  first_name: 'James',
  last_name: 'Devereux',
  email: 'freewaytofluency@gmail.com',
  password: 'secret'
)

teacher.remote_photo_url = 'app/assets/images/me.jpeg'

teacher.save

puts 'User created!'

puts 'Creating Schools'

school = School.create(
  name: 'Chuo University',
  campus: 'Tama'
)



period_3 = 

puts 'Creating courses'

course = Course.new(
  name: 'Academic Writing',
  faculty: 'Global Management',
  school: 'Chuo University',
  start_date: Date.new(2019, 9, 25),
  end_date: Date.new(2020, 1, 8),
  max_absences: 5
)

course.user = teacher
course.save

puts 'added course'