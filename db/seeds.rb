Subject.destroy_all
Message.destroy_all
User.destroy_all

subjects = ['Programming', 'Maths', 'Physics', 'History', 'Geography', 'Spanish']

@languages = ['French', 'German', 'Spanish']

subjects.each do |s|
  Subject.create!(name: s)
end


20.times do
 bio = "#{Faker::Job.title}\n #{Faker::University.name}\n #{Faker::TvShows::SiliconValley.quote}"
 user = User.create!(
    name: Faker::Games::Pokemon.name,
    surname: Faker::Games::Pokemon.name,
    email: Faker::Internet.email,
    bio: bio,
    location: Faker::Address.state,
    password: '123456',
    language: @languages.sample)
 Subject.all.sample(2).each { |s| user.learning_subjects.create(subject: s)}
end

20.times do
 bio = "#{Faker::Job.title}\n #{Faker::University.name}\n #{Faker::TvShows::SiliconValley.quote}"
 user = User.create!(
    name: Faker::Games::Pokemon.name,
    surname: Faker::Games::Pokemon.name,
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: bio,
    location: Faker::Address.state,
    language: @languages.sample)
    Subject.all.sample(2).each { |s| user.teaching_subjects.create(subject: s)}
end

20.times do
 bio = "#{Faker::Job.title}\n #{Faker::University.name}\n #{Faker::TvShows::SiliconValley.quote}"
 user = User.create!(
    name: Faker::Games::Pokemon.name,
    surname: Faker::Games::Pokemon.name,
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: bio,
    location: Faker::Address.state,
    language: @languages.sample)
 Subject.all.sample(2).each { |s| user.learning_subjects.create(subject: s)}
 Subject.all.sample(2).each { |s| user.teaching_subjects.create(subject: s)}
end
