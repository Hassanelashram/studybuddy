Subject.destroy_all
User.destroy_all

subjects = ['Programming', 'Maths', 'Physics', 'History', 'Geography', 'Spanish']
counter = 0
users = []
subjects.length.times do
  puts subject = Subject.create(
      name: subjects[counter]
    )
  counter += 1
end


6.times do
  puts user = User.create!(
    name: Faker::Games::Pokemon.name,
    surname: Faker::Games::Pokemon.name,
    location: Faker::Games::Pokemon.location,
    email: Faker::Internet.email,
    password: '123456')
  users << user.id
end

counter = 1
2.times do
  puts l = LearningSubject.create!(
    user_id: counter,
    subject_id: counter
    )
  counter += 1
end

counter = 3
2.times do
puts t = TeachingSubject.create!(
    user_id: counter,
    subject_id: counter
    )
  counter += 1
end

counter = 5
2.times do
t = TeachingSubject.create!(
    user_id: counter,
    subject_id: counter
    )
l = LearningSubject.create!(
    user_id: counter,
    subject_id: counter
    )
  counter += 1
end
