Subject.destroy_all
User.destroy_all

subjects = ['Programming', 'Maths', 'Physics', 'History', 'Geography', 'Spanish']

subjects.each do |s|
  Subject.create!(name: s)
end


2.times do
 user = User.create!(
    name: Faker::Games::Pokemon.name,
    surname: Faker::Games::Pokemon.name,
    location: Faker::Games::Pokemon.location,
    email: Faker::Internet.email,
    password: '123456')
 Subject.all.sample(2).each { |s| user.learning_subjects.create(subject: s)}
end

2.times do
 user = User.create!(
    name: Faker::Games::Pokemon.name,
    surname: Faker::Games::Pokemon.name,
    location: Faker::Games::Pokemon.location,
    email: Faker::Internet.email,
    password: '123456')
 Subject.all.sample(2).each { |s| user.teaching_subjects.create(subject: s)}
end

2.times do
 user = User.create!(
    name: Faker::Games::Pokemon.name,
    surname: Faker::Games::Pokemon.name,
    location: Faker::Games::Pokemon.location,
    email: Faker::Internet.email,
    password: '123456')
 Subject.all.sample(2).each { |s| user.learning_subjects.create(subject: s)}
 Subject.all.sample(2).each { |s| user.teaching_subjects.create(subject: s)}
end
