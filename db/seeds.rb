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

puts 'Destroying Schools, Periods, Courses'

School.destroy_all
Period.destroy_all
Course.destroy_all

puts 'Successfully destroyed Schools, Periods, Courses'

puts 'Creating Schools'

chuo = School.create(
  name: 'Chuo University',
  campus: 'Tama'
)

oberlin = School.create(
  name: 'J.F Oberlin University',
  campus: 'Shin Okubo'
)

mode = School.create(
  name: 'Mode University',
  campus: 'Shinjuku'
)

puts 'Creating Periods'

chuo_period_3 = Period.create(
  period_number: 3,
  start_time: '13:20:00',
  end_time: '15:00:00',
  school: chuo
)

chuo_period_4 = Period.create(
  period_number: 4,
  start_time: '15:10:00',
  end_time: '16:50:00',
  school: chuo
)

mode_period_1 = Period.create(
  period_number: 1,
  start_time: '9:20:00',
  end_time: '10:50:00',
  school: mode
)

puts 'Creating courses'

course_1 = Course.new(
  name: 'Academic Writing',
  faculty: 'Global Management',
  start_date: Date.new(2019, 9, 25),
  end_date: Date.new(2020, 1, 8),
  max_absences: 5,
  description: 'Academic Writing Class - second semester'
)

course_2 = Course.new(
  name: 'Academic Writing',
  faculty: 'Global Management',
  start_date: Date.new(2019, 9, 25),
  end_date: Date.new(2020, 1, 8),
  max_absences: 5,
  description: 'Academic Writing Class - second semester'
)

course_3 = Course.new(
  name: 'General English',
  faculty: 'Liberal Arts',
  start_date: Date.new(2019, 9, 25),
  end_date: Date.new(2020, 2, 4),
  max_absences: 5,
  description: 'General English Class'

)

course_1.user = teacher
course_1.school = chuo
course_1.period = chuo_period_3
course_1.save

course_2.user = teacher
course_2.school = chuo
course_2.period = chuo_period_4
course_2.save

course_3.user = teacher
course_3.school = mode
course_3.period = mode_period_1
course_3.save

puts 'Successfully added courses!'

