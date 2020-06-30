require 'open-uri'

Subject.destroy_all
Message.destroy_all
User.destroy_all

subjects = ['Programming', 'Maths', 'Physics', 'History', 'Geography', 'Spanish']

@languages = ['French', 'German', 'Spanish']

bios = [
  "I've been a teacher for 20years...",
  "I love teaching"
]
subjects.each do |s|
  Subject.create!(name: s)
end


# 20.times do
#  bio = "#{Faker::Job.title}\n #{Faker::University.name}\n #{Faker::TvShows::SiliconValley.quote}"
#  user = User.create!(
#     name: Faker::Games::Pokemon.name,
#     surname: Faker::Games::Pokemon.name,
#     email: Faker::Internet.email,
#     bio: bio,
#     location: Faker::Address.state,
#     password: '123456',
#     language: @languages.sample)
#  Subject.all.sample(2).each { |s| user.learning_subjects.create(subject: s)}
# end

# 20.times do
#  bio = "#{Faker::Job.title}\n #{Faker::University.name}\n #{Faker::TvShows::SiliconValley.quote}"
#  user = User.create!(
#     name: Faker::Games::Pokemon.name,
#     surname: Faker::Games::Pokemon.name,
#     email: Faker::Internet.email,
#     password: '123456',
#     price: rand(5...15),
#     bio: bio,
#     location: Faker::Address.state,
#     language: @languages.sample)
#     Subject.all.sample(2).each { |s| user.teaching_subjects.create(subject: s)}
# end

# 20.times do
#  bio = "#{Faker::Job.title}\n #{Faker::University.name}\n #{Faker::TvShows::SiliconValley.quote}"
#  user = User.create!(
#     name: Faker::Games::Pokemon.name,
#     surname: Faker::Games::Pokemon.name,
#     email: Faker::Internet.email,
#     password: '123456',
#     price: rand(5...15),
#     bio: bio,
#     location: Faker::Address.state,
#     language: @languages.sample)
#  Subject.all.sample(2).each { |s| user.learning_subjects.create(subject: s)}
#  Subject.all.sample(2).each { |s| user.teaching_subjects.create(subject: s)}
# end



picture1 = URI.open("https://images.unsplash.com/photo-1586297098710-0382a496c814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80")

user1 = User.create!(
    name: "John",
    surname: "Parker",
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: "Live life to the fullest...study to the fullest...learn to the fullest...be the best version of you...always!",
    location: Faker::Address.state,
    language: @languages.sample)

user1.photo.attach(io: picture1, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user1.learning_subjects.create(subject: s)}
Subject.all.sample(rand(1...2)).each { |s| user1.teaching_subjects.create(subject: s)}


picture2 = URI.open("https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2094&q=80")

user2 = User.create!(
    name: "Susan",
    surname: "Belling",
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: "I'm passionate about what I do and love to grow always knowledge-wise. Either by teaching or learning, I hope to reach perfection.",
    location: Faker::Address.state,
    language: @languages.sample)

user2.photo.attach(io: picture2, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user2.learning_subjects.create(subject: s)}
Subject.all.sample(rand(1...2)).each { |s| user2.teaching_subjects.create(subject: s)}


picture3 = URI.open("https://images.unsplash.com/photo-1527980965255-d3b416303d12?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80")

user3 = User.create!(
    name: "Michael",
    surname: "Johnson",
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: "Life's short and you have to ram into it what you can. I want to suck up knowledge in my field always. In that sense I love to either teach or learn...as long as I can continue to grow.",
    location: Faker::Address.state,
    language: @languages.sample)

user3.photo.attach(io: picture3, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user3.learning_subjects.create(subject: s)}
Subject.all.sample(rand(1...2)).each { |s| user3.teaching_subjects.create(subject: s)}


picture4 = URI.open("https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")

user4 = User.create!(
    name: "Bob",
    surname: "Gelding",
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: "I'll sleep when I die...until then I have one speed; GO! I'm here to teach my subject matter the way I live my life...to the fullest!",
    location: Faker::Address.state,
    language: @languages.sample)

user4.photo.attach(io: picture4, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...2)).each { |s| user4.teaching_subjects.create(subject: s)}


picture5 = URI.open("https://images.unsplash.com/photo-1554780336-390462301acf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")

user5 = User.create!(
    name: "Joanna",
    surname: "Peelsly",
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: "I teach and learn...and I will continue to do so all my life...until the day the lord calls me out and says it's enough.",
    location: Faker::Address.state,
    language: @languages.sample)

user5.photo.attach(io: picture5, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user5.learning_subjects.create(subject: s)}
Subject.all.sample(rand(1...2)).each { |s| user5.teaching_subjects.create(subject: s)}


picture6 = URI.open("https://images.unsplash.com/photo-1584999734482-0361aecad844?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80")

user6 = User.create!(
    name: "Francisco",
    surname: "Soriano",
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: "I have a lot of trouble with my subject matter. Any help is welcome!",
    location: Faker::Address.state,
    language: @languages.sample)

user6.photo.attach(io: picture6, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user6.learning_subjects.create(subject: s)}



picture7 = URI.open("https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80")

user7 = User.create!(
    name: "Fabianna",
    surname: "Delupo",
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: "I want to be the best in my field. If you think you can help me reach my objective...you're the teacher for me!",
    location: Faker::Address.state,
    language: @languages.sample)

user7.photo.attach(io: picture7, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user7.learning_subjects.create(subject: s)}



picture8 = URI.open("https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")

user8 = User.create!(
    name: "Vivan",
    surname: "Dirupo",
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: "Be the best at what you do...no matter what it is. That's my motto and that's how I live each and every day.",
    location: Faker::Address.state,
    language: @languages.sample)

user8.photo.attach(io: picture8, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user8.learning_subjects.create(subject: s)}
Subject.all.sample(rand(1...2)).each { |s| user8.teaching_subjects.create(subject: s)}



picture9 = URI.open("https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&auto=format&fit=crop&w=934&q=80")

user9 = User.create!(
    name: "Giuseppe",
    surname: "Pantani",
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: "No pain, no gain...I strive for excellence and put in the extra mile in everything I do",
    location: Faker::Address.state,
    language: @languages.sample)

user9.photo.attach(io: picture9, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user9.learning_subjects.create(subject: s)}
Subject.all.sample(rand(1...2)).each { |s| user9.teaching_subjects.create(subject: s)}



picture10 = URI.open("https://images.unsplash.com/photo-1520813792240-56fc4a3765a7?ixlib=rb-1.2.1&auto=format&fit=crop&w=2100&q=80")

user10 = User.create!(
    name: "Juliana",
    surname: "Martinez",
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: "I love what I do and love to teach what I do...learn with a smile :)",
    location: Faker::Address.state,
    language: @languages.sample)

user10.photo.attach(io: picture10, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...2)).each { |s| user10.teaching_subjects.create(subject: s)}



picture11 = URI.open("https://images.unsplash.com/photo-1543096222-72de739f7917?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")

user11 = User.create!(
    name: "Linda",
    surname: "Benucci",
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: "Never say never! If you want to learn it, you have to put in the effort...I'll light the way!",
    location: Faker::Address.state,
    language: @languages.sample)

user11.photo.attach(io: picture11, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...2)).each { |s| user11.teaching_subjects.create(subject: s)}

picture12 = URI.open("https://images.unsplash.com/photo-1548544149-4835e62ee5b3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")

user12 = User.create!(
    name: "Paul",
    surname: "Watson",
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: "Like Rocky, I'm a fighter! Let me take you under my wing and I'll lead you to victory in your field!",
    location: Faker::Address.state,
    language: @languages.sample)

user12.photo.attach(io: picture12, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...2)).each { |s| user12.teaching_subjects.create(subject: s)}


picture13 = URI.open("https://images.unsplash.com/photo-1551069613-1904dbdcda11?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=956&q=80")

user13 = User.create!(
    name: "Shauna",
    surname: "Jordan",
    email: Faker::Internet.email,
    password: '123456',
    price: rand(5...15),
    bio: "Help me...help you! Together we can make it happen :)",
    location: Faker::Address.state,
    language: @languages.sample)

user13.photo.attach(io: picture13, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...2)).each { |s| user13.teaching_subjects.create(subject: s)}



picture14 = URI.open("https://images.unsplash.com/photo-1549351236-caca0f174515?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80")

user14 = User.create!(
    name: "Anne",
    surname: "Peters",
    email: Faker::Internet.email,
    password: '123456',
    bio: "Help me...help you! Together we can make it happen :)",
    location: Faker::Address.state,
    language: @languages.sample)

user14.photo.attach(io: picture14, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user14.learning_subjects.create(subject: s)}


picture15 = URI.open("https://images.unsplash.com/photo-1568967729548-e3dbad3d37e0?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")

user15 = User.create!(
    name: "Beate",
    surname: "Franklin",
    email: Faker::Internet.email,
    password: '123456',
    bio: "I'm so lost in my field. Any help is appreciated!! I want to reach my objective and am willing to give all my heart and soul in order to reach it. Can you help me?",
    location: Faker::Address.state,
    language: @languages.sample)

user15.photo.attach(io: picture15, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user15.learning_subjects.create(subject: s)}



picture16 = URI.open("https://images.unsplash.com/photo-1541647376583-8934aaf3448a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")

user16 = User.create!(
    name: "John",
    surname: "Bobbit",
    email: Faker::Internet.email,
    password: '123456',
    bio: "I'm last in my class :( I need to receive some serious help. I'm quite desperate!",
    location: Faker::Address.state,
    language: @languages.sample)

user16.photo.attach(io: picture16, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user16.learning_subjects.create(subject: s)}


picture17 = URI.open("https://images.unsplash.com/photo-1488426862026-3ee34a7d66df?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")

user17 = User.create!(
    name: "Rachel",
    surname: "Vilanda",
    email: Faker::Internet.email,
    password: '123456',
    bio: "I need to pass my exams...am tired of repeating. Please somebody help me!!",
    location: Faker::Address.state,
    language: @languages.sample)

user17.photo.attach(io: picture17, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user17.learning_subjects.create(subject: s)}



picture18 = URI.open("https://images.unsplash.com/photo-1544348817-5f2cf14b88c8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")

user18 = User.create!(
    name: "Aaron",
    surname: "Stephens",
    email: Faker::Internet.email,
    password: '123456',
    bio: "I'm struggling so much with my course material. I need someone to help me out. I'd love to be able to bounce my knowledge of someone who can fill in the blanks.",
    location: Faker::Address.state,
    language: @languages.sample)

user18.photo.attach(io: picture18, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user18.learning_subjects.create(subject: s)}


picture19 = URI.open("https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80")

user19 = User.create!(
    name: "George",
    surname: "Fowler",
    email: Faker::Internet.email,
    password: '123456',
    bio: "I'm struggling so much with my course material. I need someone to help me out. I'd love to be able to bounce my knowledge of someone who can fill in the blanks.",
    location: Faker::Address.state,
    language: @languages.sample)

user19.photo.attach(io: picture19, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user19.learning_subjects.create(subject: s)}



picture20 = URI.open("https://images.unsplash.com/photo-1542131596-dea5384842c7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=934&q=80")

user20 = User.create!(
    name: "Wanda",
    surname: "Beckinson",
    email: Faker::Internet.email,
    password: '123456',
    bio: "I need some help in order to pass my exams at the end of the term. I'll be needing at least 10 to 15 hours of intensive courses.",
    location: Faker::Address.state,
    language: @languages.sample)

user20.photo.attach(io: picture20, filename: "avatar.png", content_type: "image/png" )
Subject.all.sample(rand(1...3)).each { |s| user20.learning_subjects.create(subject: s)}



# 15.times do
#   picture = URI.open("https://images.unsplash.com/photo-1586297098710-0382a496c814?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2100&q=80")
#   user = User.create!(
#     name: Faker::Name.first_name,
#     surname: Faker::Name.last_name,
#     email: Faker::Internet.email,
#     password: '123456',
#     price: rand(5...15),
#     bio: bios.sample,
#     location: Faker::Address.state,
#     language: @languages.sample)
#   user.photo.attach(io: picture, filename: "avatar.png", content_type: "image/png" )
#   Subject.all.sample(rand(0...3)).each { |s| user.learning_subjects.create(subject: s)}
#   Subject.all.sample(rand(0...2)).each { |s| user.teaching_subjects.create(subject: s)}
# end
